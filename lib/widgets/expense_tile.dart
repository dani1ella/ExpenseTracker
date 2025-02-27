import 'package:flutter/material.dart';
// ignore: unused_import
import '../models/expense.dart';

class ExpenseTile extends StatelessWidget {
  final String title;
  final double amount;
  final DateTime date;

  const ExpenseTile({
    Key? key,
    required this.title,
    required this.amount,
    required this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text('${date.toLocal()}'),  // Format the date as needed
      trailing: Text('\$${amount.toStringAsFixed(2)}'),
    );
  }
}
