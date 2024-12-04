import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../models/expense.dart';

class ExpenseForm extends StatefulWidget {
  const ExpenseForm({super.key, required this.onCreated});

  final Function(Expense) onCreated;

  @override
  State<ExpenseForm> createState() => _ExpenseFormState();
}

class _ExpenseFormState extends State<ExpenseForm> {
  final _titleController = TextEditingController();
  final _valueController = TextEditingController();

  String get title => _titleController.text;

  // Dropdown-related state
  Category? _selectedCategory;

  // Date picker-related state
  DateTime? _selectedDate;

  @override
  void dispose() {
    _titleController.dispose();
    _valueController.dispose();
    super.dispose();
  }

  void onCancel() {
    // Close modal
    Navigator.pop(context);
  }

  void onAdd() {
    // 1- Get the values from inputs
    String title = _titleController.text;
    double amount = double.parse(_valueController.text);

    if (_selectedCategory == null) {
      // Show an error message if category is not selected
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a category')),
      );
      return;
    }

    if (_selectedDate == null) {
      // Show an error message if date is not selected
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please select a date')),
      );
      return;
    }

    // 2- Create the expense
    Expense expense = Expense(
      title: title,
      amount: amount,
      date: _selectedDate!,
      category: _selectedCategory!,
    );

    // 3- Ask the parent to add the expense
    widget.onCreated(expense);

    // 4- Close modal
    Navigator.pop(context);
  }

  Future<void> _selectDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            controller: _titleController,
            maxLength: 50,
            decoration: const InputDecoration(
              label: Text('Title'),
            ),
          ),
          TextField(
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly,
            ],
            controller: _valueController,
            maxLength: 50,
            decoration: const InputDecoration(
              prefix: Text('\$ '),
              label: Text('Amount'),
            ),
          ),
          DropdownButton<Category>(
            value: _selectedCategory,
            hint: const Text('Select a category'),
            items: Category.values.map((Category category) {
              return DropdownMenuItem<Category>(
                value: category,
                child: Text(
                  category.name.toUpperCase(),
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              );
            }).toList(),
            onChanged: (Category? newValue) {
              setState(() {
                _selectedCategory = newValue;
              });
            },
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: Text(
                  _selectedDate == null
                      ? 'No date selected'
                      : 'Selected Date: ${_selectedDate!.toLocal()}'.split(' ')[0],
                ),
              ),
              IconButton(
                icon: const Icon(Icons.calendar_today),
                onPressed: _selectDate,
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(onPressed: onCancel, child: const Text('Cancel')),
              const SizedBox(width: 20),
              ElevatedButton(onPressed: onAdd, child: const Text('Save Expense')),
            ],
          ),
        ],
      ),
    );
  }
}
