import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/expense_provider.dart';
// ignore: unused_import
import '../models/expense.dart';
import '../widgets/expense_tile.dart';
import 'add_expense_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final expenseProvider = Provider.of<ExpenseProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Expense Tracker')),
      body: FutureBuilder(
        future: expenseProvider.loadExpenses(),
        builder: (context, snapshot) {
          return ListView.builder(
            itemCount: expenseProvider.expenses.length,
            itemBuilder: (context, index) {
              final expense = expenseProvider.expenses[index];
              return ExpenseTile(
                title: expense.title,
                amount: expense.amount,  // Default to 0.0 if null
                date: expense.date,  // Default to current date if null
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddExpenseScreen()),
          );
        },
      ),
    );
  }
}
