import 'package:flutter/material.dart';
import '../models/budget.dart';

class BudgetCard extends StatelessWidget {
  final Budget budget;

  const BudgetCard({Key? key, required this.budget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        title: Text('Budget: \$${budget.budgetAmount}'),
        subtitle: Text('From: ${budget.startDate.toLocal()} To: ${budget.endDate.toLocal()}'),
        trailing: Icon(Icons.money),
      ),
    );
  }
}
