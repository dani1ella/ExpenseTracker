import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/expense.dart';

class DBHelper {
  static Future<Database> database() async {
    final dbPath = await getDatabasesPath();
    return openDatabase(
      join(dbPath, 'expense_tracker.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE expenses(id TEXT PRIMARY KEY, title TEXT, amount REAL, date TEXT)',
        );
      },
      version: 1,
    );
  }

  static Future<void> insertExpense(Expense expense) async {
    final db = await database();
    db.insert(
      'expenses',
      {
        'id': expense.id,
        'title': expense.title,
        'amount': expense.amount,
        'date': expense.date.toIso8601String(),
      },
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<Expense>> getExpenses() async {
    final db = await database();
    final List<Map<String, dynamic>> data = await db.query('expenses');
    return List.generate(data.length, (i) {
      return Expense(
        id: data[i]['id'],
        title: data[i]['title'],
        amount: data[i]['amount'],
        date: DateTime.parse(data[i]['date']),
      );
    });
  }
}
