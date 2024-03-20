import 'package:expense_tracker/logger/logger_factory.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/new_expense.dart';
import 'package:expense_tracker/widget/chart/chart.dart';
import 'package:expense_tracker/widget/expenses_list/expenses_list.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  final Logger _logger = LoggerFactory.getLogger();
  final List<Expense> _registeredExpenses = [
    Expense(
      title: 'Flutter Course',
      amount: 19.99,
      date: DateTime.now(),
      category: Category.work,
    ),
    Expense(
      title: 'Cinema',
      amount: 15.69,
      date: DateTime.now(),
      category: Category.leisure,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    Widget mainContent = _registeredExpenses.isEmpty
        ? const Center(
            child: Text("No expenses found. Start adding some!"),
          )
        : ExpensesList(
            expenses: _registeredExpenses,
            onDismiss: _removeExpense,
          );

    return Scaffold(
      appBar: AppBar(
        title: const Text("Flutter ExpensesTracker"),
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          Chart(expenses: _registeredExpenses),
          Expanded(
            child: mainContent,
          )
        ],
      ),
    );
  }

  void _openAddExpenseOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) => NewExpense(onAddExpense: _addExpense),
    );
  }

  void _addExpense(Expense e) {
    _logger.i("begin");
    setState(() {
      _logger.d('expense <=: $e');
      _registeredExpenses.add(e);
    });
    _logger.i("end");
  }

  void _removeExpense(Expense e) {
    _logger.i("begin");
    final expenseIndex = _registeredExpenses.indexOf(e);
    setState(() {
      _logger.d("dismiss expense <=: $e");
      _registeredExpenses.remove(e);
    });
    ScaffoldMessenger.of(context).clearSnackBars(); // 連続削除された時
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text("Expense deleted"),
        action: SnackBarAction(
          label: "Undo",
          onPressed: () {
            setState(() => _registeredExpenses.insert(expenseIndex, e));
          },
        ),
      ),
    );
    _logger.i("end");
  }
}
