import 'dart:ffi';

import 'package:flutter/material.dart';

import 'models/Expense.dart';

class NewExpense extends StatefulWidget {
  const NewExpense(this.addExpense, {super.key});

  final Function(Expense expense) addExpense;

  @override
  _NewExpenseState createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _expenseDate;
  ExpenseType expenseType = ExpenseType.entertainment;

  String? titleError;

  void _submitExpense() {
    var enteredTitle = _titleController.text;
    var enteredAmount = double.tryParse(_amountController.text);
    var enteredDate = _expenseDate;

    if (enteredTitle.isEmpty) {
      setState(() {
        titleError = "Please enter a title";
      });
    }

    if (enteredTitle.isEmpty ||
        enteredAmount == null ||
        enteredAmount <= 0 ||
        enteredDate == null) {
      showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
                title: const Text("Invalid Input"),
                content: const Text(
                    "Please enter valid title, amount and date, to Submit the Expense"),
                actions: [
                  TextButton(
                      onPressed: () => Navigator.of(ctx).pop(),
                      child: const Text("Okay"))
                ],
              ));
      return;
    }

    var expense = Expense(
        title: enteredTitle,
        amount: enteredAmount,
        date: enteredDate,
        expenseType: expenseType);

    widget.addExpense(expense);
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  void _presentDatePicker() async {
    final date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2021),
      lastDate: DateTime.now(),
    );

    setState(() {
      _expenseDate = date;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16,48,16,16),
      child: Column(
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            style: Theme.of(context).textTheme.titleMedium,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(
              labelText: "Title",
              errorText: titleError,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _amountController,
                  keyboardType: TextInputType.number,
                  style: Theme.of(context).textTheme.titleMedium,
                  decoration: const InputDecoration(
                    prefixText: "Rs ",
                    labelText: "Amount",
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      style: Theme.of(context).textTheme.titleMedium,
                      _expenseDate == null
                          ? "No Date Chosen"
                          : formatter.format(_expenseDate!),
                    ),
                    IconButton(
                      onPressed: _presentDatePicker,
                      icon: const Icon(Icons.calendar_month),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            children: [
              DropdownButton(
                  value: expenseType,
                  style: Theme.of(context).textTheme.titleMedium,
                  items: ExpenseType.values
                      .map(
                        (value) => DropdownMenuItem(
                          value: value,
                          child: Text(value.name.toUpperCase()),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    value == null
                        ? null
                        : setState(() {
                            expenseType = value;
                          });
                  }),
              const Spacer(),
              ElevatedButton(
                onPressed: _submitExpense,
                child: const Text("Add Expense"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Cancel"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
