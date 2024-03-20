import 'package:expense_tracker/models/expense.dart';

class ExpenseBucket {
  final Category category;
  final List<Expense> expenses;

  ExpenseBucket({
    required this.category,
    required this.expenses,
  });

  double get totalExpenses => expenses.fold(
      0.0, (previousValue, element) => previousValue + element.amount);
}
