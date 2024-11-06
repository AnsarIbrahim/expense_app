import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum Category {
  food,
  bills,
  clothes,
  entertainment,
  health,
  transport,
  other,
}

const categoryIcons = {
  Category.food: Icons.fastfood,
  Category.bills: Icons.receipt,
  Category.clothes: Icons.shopping_bag,
  Category.entertainment: Icons.movie,
  Category.health: Icons.healing,
  Category.transport: Icons.directions_bus,
  Category.other: Icons.category,
};

class Expense {
  Expense(
      {required this.title,
      required this.amount,
      required this.date,
      required this.category})
      : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  // String get formattedDate => '${date.day}/${date.month}/${date.year}';
}

class ExpenseBucket {
  const ExpenseBucket({required this.category, required this.expenses});

  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
      : expenses = allExpenses
            .where((expense) => expense.category == category)
            .toList();

  final Category category;
  final List<Expense> expenses;

  double get totalExpenses {
    double sum = 0;

    for (final expense in expenses) {
      sum += expense.amount;
    }

    return sum;
  }
}
