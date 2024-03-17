import 'package:expense_tracker/expenses.dart';
import 'package:expense_tracker/logger/logger_factory.dart';
import 'package:flutter/material.dart';

ColorScheme kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(
    225,
    96,
    59,
    181,
  ),
);

void main() {
  final logger = LoggerFactory.getLogger();
  logger.i("App Start!!");
  runApp(
    MaterialApp(
      theme: ThemeData().copyWith(
          useMaterial3: true,
          colorScheme: kColorScheme,
          appBarTheme: const AppBarTheme().copyWith(
            backgroundColor: kColorScheme.onPrimaryContainer,
            foregroundColor: kColorScheme.primaryContainer,
          )),
      home: const Expenses(),
    ),
  );
}
