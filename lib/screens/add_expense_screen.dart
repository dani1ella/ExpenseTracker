import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/expense.dart';
import '../providers/expense_provider.dart';

class AddExpenseScreen extends StatefulWidget {
  @override
  _AddExpenseScreenState createState() => _AddExpenseScreenState();
}

class _AddExpenseScreenState extends State<AddExpenseScreen> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;

  void _submitExpense() {
    final title = _titleController.text;
    final amount = double.tryParse(_amountController.text);
    if (title.isEmpty || amount == null || _selectedDate == null) return;

    final newExpense = Expense(
      id: DateTime.now().toString(),
      title: title,
      amount: amount,
      date: _selectedDate!,
    );

    Provider.of<ExpenseProvider>(context, listen: false).addExpense(newExpense);

    Navigator.of(context).pop();
  }

  void _selectDate() async {
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime.now(),
    );
    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Expense')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Expense Title'),
            ),
            TextField(
              controller: _amountController,
              decoration: InputDecoration(labelText: 'Amount'),
              keyboardType: TextInputType.number,
            ),
            Row(
              children: [
                Text(_selectedDate == null
                    ? 'No date chosen!'
                    : 'Picked Date: ${_selectedDate!.toLocal()}'),
                TextButton(
                  onPressed: _selectDate,
                  child: Text('Choose Date'),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: _submitExpense,
              child: Text('Add Expense'),
            ),
          ],
        ),
      ),
    );
  }
}
