import 'package:expense_tracker/expenses.dart';
import 'package:expense_tracker/logger/logger_factory.dart';
import 'package:flutter/material.dart';

void main() {
  final logger = LoggerFactory.getLogger();
  logger.i("App Start!!");
  runApp(
    MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: const Expenses(),
    ),
  );
}
