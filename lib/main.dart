import 'package:expense_tracker/constants/app_theme.dart';
import 'package:expense_tracker/expenses.dart';
import 'package:expense_tracker/logger/logger_factory.dart';
import 'package:flutter/material.dart';

void main() {
  final logger = LoggerFactory.getLogger();
  logger.i("App Start!!");
  runApp(
    MaterialApp(
      darkTheme: AppTheme.darkTheme,
      theme: AppTheme.baseTheme,
      themeMode: ThemeMode.system,
      home: const Expenses(),
    ),
  );
}
