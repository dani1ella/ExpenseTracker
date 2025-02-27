import 'package:flutter/material.dart';
import '../models/expense.dart';

class ExpenseProvider with ChangeNotifier {
  List<Expense> _expenses = [];

  List<Expense> get expenses => _expenses;

  Future<void> loadExpenses() async {
    // Load expenses from database or mock data
    await Future.delayed(Duration(seconds: 1)); // Simulate loading delay
    _expenses = [
      Expense(id: '1', title: 'Groceries', amount: 50.00, date: DateTime.now()),
      Expense(id: '2', title: 'Rent', amount: 1000.00, date: DateTime.now()),
    ];
    notifyListeners();
  }

  void addExpense(Expense expense) {
    _expenses.add(expense);
    notifyListeners();
  }

  void removeExpense(String id) {
    _expenses.removeWhere((expense) => expense.id == id);
    notifyListeners();
  }
}
