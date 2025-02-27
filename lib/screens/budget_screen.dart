import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/budget_provider.dart';
// ignore: unused_import
import '../models/budget.dart';

class BudgetScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final budgetProvider = Provider.of<BudgetProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Set Budget')),
      body: budgetProvider.budget == null
          ? Center(child: Text('No budget set!'))
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text('Budget Amount: \$${budgetProvider.budget!.budgetAmount}'),
                  Text(
                      'Start Date: ${budgetProvider.budget!.startDate.toLocal()}'),
                  Text(
                      'End Date: ${budgetProvider.budget!.endDate.toLocal()}'),
                  ElevatedButton(
                    onPressed: () {
                      budgetProvider.removeBudget();
                    },
                    child: Text('Remove Budget'),
                  ),
                ],
              ),
            ),
    );
  }
}
