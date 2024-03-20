import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/models/expense_bucket.dart';
import 'package:test/test.dart';

void main() {
  group(
    ExpenseBucket,
    () {
      test("ExpenseBucket totalExpenses test", () {
        final expenses = List.generate(
          5,
          (index) => Expense(
              title: "title",
              amount: index.toDouble() + 1,
              date: DateTime.now(),
              category: Category.food),
        );
        final bucket = ExpenseBucket(
          category: Category.food,
          expenses: expenses,
        );
        expect(bucket.totalExpenses, 1 + 2 + 3 + 4 + 5);
      });
    },
  );
}
