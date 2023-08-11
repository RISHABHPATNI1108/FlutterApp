import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

final formatter = DateFormat.yMd();

const expenseTypeIcon = {
  ExpenseType.work: Icons.work,
  ExpenseType.entertainment: Icons.movie,
  ExpenseType.food: Icons.lunch_dining,
  ExpenseType.travel: Icons.flight,
};

class Expense {
  Expense(
      {required this.title,
      required this.amount,
      required this.date,
      required this.expenseType})
      : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final ExpenseType expenseType;

  get formattedDate {
    return formatter.format(date);
  }
}

class ExpensesBucket {
  ExpensesBucket({
    required this.expenseType,
    required this.expenses,
  });

  ExpensesBucket.fromExpenses(List<Expense> allExpenses, this.expenseType)
      : expenses = allExpenses.where((element) => element.expenseType == expenseType).toList();

  ExpenseType expenseType;
  List<Expense> expenses;

  double get totalAmount {
    return expenses.fold(0.0, (previousValue, element) => previousValue + element.amount);
  }

}

enum ExpenseType {
  food,
  entertainment,
  travel,
  work,
}
