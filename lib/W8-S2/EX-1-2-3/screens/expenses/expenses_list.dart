import 'package:flutter/material.dart';
import '../../models/expense.dart';
import 'expenses_item.dart';

class ExpensesList extends StatefulWidget {
  const ExpensesList({
    super.key,
    required this.expenses,
    required this.onExpenseRemoved,
  });

  final List<Expense> expenses;
  final Function(Expense) onExpenseRemoved;

  @override
  _ExpensesListState createState() => _ExpensesListState();
}

class _ExpensesListState extends State<ExpensesList> {
  // Temporary variables to store the removed expense
  Expense? _removedExpense;
  int? _removedExpenseIndex;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: widget.expenses.isEmpty
          ? const Center(
              child: Text(
                'No expenses found. Start adding some!',
                style: TextStyle(fontSize: 18),
              ),
            )
          : ListView.builder(
              itemCount: widget.expenses.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: ValueKey(widget.expenses[index].id),
                  direction: DismissDirection.endToStart,
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.only(right: 20),
                    child: const Icon(
                      Icons.delete,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                  onDismissed: (direction) {
                    // Store the removed expense and its index
                    _removedExpense = widget.expenses[index];
                    _removedExpenseIndex = index;

                    // Call the callback to remove the expense
                    widget.onExpenseRemoved(widget.expenses[index]);

                    // Show SnackBar with undo option
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: const Text('Expense deleted.'),
                        action: SnackBarAction(
                          label: 'Undo',
                          onPressed: _undoRemove,
                        ),
                        duration: const Duration(seconds: 3),
                      ),
                    );
                  },
                  child: ExpenseItem(widget.expenses[index]),
                );
              },
            ),
    );
  }

  // Undo method to re-add the removed expense
  void _undoRemove() {
    if (_removedExpense != null && _removedExpenseIndex != null) {
      setState(() {
        widget.expenses.insert(_removedExpenseIndex!, _removedExpense!);
      });
      // Re-insert the removed expense back into the list
    }
  }
}
