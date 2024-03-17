import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/utils/date_time_utils.dart';
import 'package:flutter/material.dart';

class ExpensesItem extends StatelessWidget {
  final Expense expense;

  const ExpensesItem({
    super.key,
    required this.expense,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              expense.title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Text("¥${expense.amount.toStringAsFixed(2)}"),
                const Spacer(),
                Row(
                  children: [
                    Icon(categoryIcons[expense.category]),
                    const SizedBox(height: 8),
                    Text(DateTimeUtils.format(date: expense.date))
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
