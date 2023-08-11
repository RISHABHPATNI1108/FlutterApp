import 'package:flutter/cupertino.dart';
import 'package:my_app/expenses/home/expense_item.dart';
import '../models/Expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList(this.expenses, this.removeExpense, {super.key});

  final List<Expense> expenses;
  final Function(Expense expense) removeExpense;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(10),
      itemCount: expenses.length,
      itemBuilder: (context, index) => Dismissible(
        key: ValueKey(expenses[index]),
        onDismissed: (direction) {
          removeExpense(expenses[index]);
        },
        child: ExpenseItem(expenses[index]),
      ),
    );
  }
}
