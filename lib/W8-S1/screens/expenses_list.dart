import 'package:flutter/material.dart';

import '../models/expense.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({super.key, required this.expenses});

  final List<Expense> expenses;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ...expenses.map((item) => Container(
        child:Row(
          children: [
            Text(item.title),
            Text(item.type.toString()),
            Text(item.date.toString()),
          ],
        )
      )),
      
    ]);
  }
}
