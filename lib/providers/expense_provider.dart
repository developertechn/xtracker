import 'package:flutter/material.dart';
import 'package:xtracker/models/transaction.dart';

class ExpenseProvider extends ChangeNotifier {
  final List<Transaction> _transactions = [
    Transaction(
      id: '1',
      title: 'Grocery Store',
      amount: 85.00,
      date: DateTime.now(),
      type: TransactionType.expense,
      category: TransactionCategory.shopping,
    ),
    Transaction(
      id: '2',
      title: 'Freelance Payment',
      amount: 500.00,
      date: DateTime.now().subtract(const Duration(days: 1)),
      type: TransactionType.income,
      category: TransactionCategory.work,
    ),
    Transaction(
      id: '3',
      title: 'Starbucks',
      amount: 6.50,
      date: DateTime.now().subtract(const Duration(days: 1)),
      type: TransactionType.expense,
      category: TransactionCategory.food,
    ),
    Transaction(
      id: '4',
      title: 'Gym Membership',
      amount: 45.00,
      date: DateTime(2023, 10, 24),
      type: TransactionType.expense,
      category: TransactionCategory.health,
    ),
  ];

  List<Transaction> get transactions => _transactions;

  double get totalBalance {
    return _transactions.fold(0, (sum, item) {
      if (item.type == TransactionType.income) {
        return sum + item.amount;
      } else {
        return sum - item.amount;
      }
    });
  }

  double get totalIncome {
    return _transactions
        .where((item) => item.type == TransactionType.income)
        .fold(0, (sum, item) => sum + item.amount);
  }

  double get totalExpense {
    return _transactions
        .where((item) => item.type == TransactionType.expense)
        .fold(0, (sum, item) => sum + item.amount);
  }

  void addTransaction(Transaction transaction) {
    _transactions.insert(0, transaction);
    notifyListeners();
  }
}
