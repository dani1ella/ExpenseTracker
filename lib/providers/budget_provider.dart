import 'package:flutter/material.dart';
import '../models/budget.dart';

class BudgetProvider with ChangeNotifier {
  Budget? _budget;

  Budget? get budget => _budget;

  void setBudget(Budget budget) {
    _budget = budget;
    notifyListeners();
  }

  void removeBudget() {
    _budget = null;
    notifyListeners();
  }
}
