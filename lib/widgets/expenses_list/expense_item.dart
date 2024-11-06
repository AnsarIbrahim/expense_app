import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/expense.dart';

class ExpenseItem extends StatelessWidget {
  const ExpenseItem({
    super.key,
    required this.expense,
  });

  final Expense expense;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 16,
      ),
      child: Column(
        children: [
          Text(expense.title),
          const SizedBox(height: 4),
          Row(
            children: [
              Text(
                '\$${expense.amount.toStringAsFixed(2)}',
              ),
              const Spacer(),
              Row(
                children: [
                  Icon(categoryIcons[expense.category],
                      size: 20, color: Colors.blue),
                  const SizedBox(width: 4),
                  Text(DateFormat.yMMMd().format(expense.date)),
                ],
              )
            ],
          )
        ],
      ),
    ));
  }
}
