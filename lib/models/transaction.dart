import 'package:flutter/material.dart';

enum TransactionType { income, expense }

enum TransactionCategory {
  food,
  transport,
  shopping,
  entertainment,
  health,
  work,
  bills,
  other,
}

class Transaction {
  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final TransactionType type;
  final TransactionCategory category;

  Transaction({
    required this.id,
    required this.title,
    required this.amount,
    required this.date,
    required this.type,
    required this.category,
  });

  IconData get icon {
    switch (category) {
      case TransactionCategory.food:
        return Icons.restaurant;
      case TransactionCategory.transport:
        return Icons.directions_car;
      case TransactionCategory.shopping:
        return Icons.shopping_bag;
      case TransactionCategory.entertainment:
        return Icons.movie;
      case TransactionCategory.health:
        return Icons.fitness_center;
      case TransactionCategory.work:
        return Icons.work;
      case TransactionCategory.bills:
        return Icons.receipt_long;
      case TransactionCategory.other:
        return Icons.category;
    }
  }

  Color get color {
    switch (category) {
      case TransactionCategory.food:
        return Colors.blue;
      case TransactionCategory.transport:
        return Colors.green;
      case TransactionCategory.shopping:
        return Colors.purple;
      case TransactionCategory.entertainment:
        return Colors.orange;
      case TransactionCategory.health:
        return Colors.red;
      case TransactionCategory.work:
        return Colors.teal;
      case TransactionCategory.bills:
        return Colors.yellow;
      case TransactionCategory.other:
        return Colors.grey;
    }
  }
}
