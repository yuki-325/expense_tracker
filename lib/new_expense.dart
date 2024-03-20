import 'package:expense_tracker/logger/logger_factory.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/utils/date_time_utils.dart';
import 'package:flutter/material.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({
    Key? key,
    required this.onAddExpense,
  }) : super(key: key);

  final void Function(Expense expense) onAddExpense;

  @override
  State<NewExpense> createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _logger = LoggerFactory.getLogger();
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;
  var _selectedCategory = Category.leisure;

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        return SizedBox(
          height: double.infinity,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(16, 48, 16, keyboardSpace + 16),
              child: Column(
                children: [
                  if (width > 600)
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _titleController,
                            maxLength: 50,
                            decoration: const InputDecoration(
                              label: Text("Title"),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 24,
                        ),
                        Expanded(
                          child: TextField(
                            controller: _amountController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              prefixText: '\$ ',
                              label: Text("Amount"),
                            ),
                          ),
                        )
                      ],
                    )
                  else
                    TextField(
                      controller: _titleController,
                      maxLength: 50,
                      decoration: const InputDecoration(
                        label: Text("Title"),
                      ),
                    ),
                  if (width > 600)
                    Row(
                      children: [
                        DropdownButton(
                            value: _selectedCategory,
                            items: Category.values
                                .map((category) => DropdownMenuItem(
                                      value: category,
                                      child: Text(category.name.toUpperCase()),
                                    ))
                                .toList(),
                            onChanged: (value) {
                              if (value == null) {
                                return;
                              }
                              setState(() => _selectedCategory = value);
                            }),
                        const SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(_selectedDate != null
                                  ? DateTimeUtils.format(date: _selectedDate!)
                                  : "Selected Date"),
                              IconButton(
                                  onPressed: _presentDatePicker,
                                  icon: const Icon(Icons.calendar_month))
                            ],
                          ),
                        )
                      ],
                    )
                  else
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _amountController,
                            keyboardType: TextInputType.number,
                            decoration: const InputDecoration(
                              prefixText: '\$ ',
                              label: Text("Amount"),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(_selectedDate != null
                                  ? DateTimeUtils.format(date: _selectedDate!)
                                  : "Selected Date"),
                              IconButton(
                                  onPressed: _presentDatePicker,
                                  icon: const Icon(Icons.calendar_month))
                            ],
                          ),
                        )
                      ],
                    ),
                  const SizedBox(
                    height: 16,
                  ),
                  if (width > 600)
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Spacer(),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("Cancel"),
                        ),
                        ElevatedButton(
                          onPressed: _submitExpenseData,
                          child: const Text("Save Expense"),
                        )
                      ],
                    )
                  else
                    Row(
                      children: [
                        DropdownButton(
                            value: _selectedCategory,
                            items: Category.values
                                .map((category) => DropdownMenuItem(
                                      value: category,
                                      child: Text(category.name.toUpperCase()),
                                    ))
                                .toList(),
                            onChanged: (value) {
                              if (value == null) {
                                return;
                              }
                              setState(() => _selectedCategory = value);
                            }),
                        const Spacer(),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text("Cancel"),
                        ),
                        ElevatedButton(
                          onPressed: _submitExpenseData,
                          child: const Text("Save Expense"),
                        )
                      ],
                    )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future<void> _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = now.subtract(
      const Duration(days: DateTimeUtils.yearDays),
    );
    final pickerDate = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: firstDate,
      lastDate: now,
    );
    setState(() {
      _selectedDate = pickerDate;
    });
  }

  void _submitExpenseData() {
    _logger.i("begin");
    final enteredAmount = double.tryParse(_amountController.text);
    final amountIsInvalid = enteredAmount == null || enteredAmount <= 0;
    // validation
    if (_titleController.text.trim().isEmpty ||
        amountIsInvalid ||
        _selectedDate == null) {
      _logger.w("invalid input.");
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Invalid input"),
          content: const Text(
              "Please make sure a valid title, amount, date and category was entered."),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("OK"),
            ),
          ],
        ),
      );
      return;
    }
    widget.onAddExpense(Expense(
        amount: double.parse(_amountController.text),
        title: _titleController.text,
        category: _selectedCategory,
        date: _selectedDate!));
    Navigator.pop(context);
    _logger.i("end");
  }
}
