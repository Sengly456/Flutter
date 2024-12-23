import 'package:flutter/material.dart';
import '../models/grocery_item.dart';
import '../models/grocery_category.dart';

class NewItem extends StatefulWidget {
  const NewItem({super.key});

  @override
  State<NewItem> createState() => _NewItemState();
}

class _NewItemState extends State<NewItem> {
  final _formKey = GlobalKey<FormState>();
  String _enteredName = '';
  int _enteredQuantity = 1;
  GroceryCategory? _selectedCategory;

  String? _validateName(String? value) {
    if (value == null ||
        value.isEmpty ||
        value.trim().length < 2 ||
        value.trim().length > 50) {
      return 'Name must be between 2 and 50 characters.';
    }
    return null;
  }

  String? _validateQuantity(String? value) {
    if (value == null || int.tryParse(value) == null) {
      return 'The quantity must be valid';
    } else if (int.tryParse(value)! <= 0) {
      return "The quantity must be positive";
    }
    return null;
  }

  String? _validateCategory(GroceryCategory? value) {
    if (value == null) {
      return "Please select a category";
    }
    return null;
  }

  // Function to handle saving the item
  void _saveItem() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      // Create a new GroceryItem
      final newItem = GroceryItem(
        name: _enteredName,
        quantity: _enteredQuantity,
        category: _selectedCategory!,
        id: '',
      );

      // Pass the new item back to the previous screen
      Navigator.of(context).pop(newItem);
    }
  }

  // Function to reset the form
  void _resetForm() {
    _formKey.currentState!.reset();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add a new item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                maxLength: 50,
                decoration: const InputDecoration(label: Text('Name')),
                initialValue: _enteredName,
                validator: _validateName,
                onSaved: (value) {
                  _enteredName = value!;
                },
              ),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration:
                          const InputDecoration(label: Text('Quantity')),
                      initialValue: '1',
                      keyboardType: TextInputType.number,
                      validator: _validateQuantity,
                      onSaved: (value) {
                        _enteredQuantity = int.parse(value!);
                      },
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: DropdownButtonFormField<GroceryCategory>(
                      value: _selectedCategory,
                      decoration:
                          const InputDecoration(label: Text('Category')),
                      items: GroceryCategory.values.map((category) {
                        return DropdownMenuItem(
                          value: category,
                          child: Row(
                            children: [
                              Container(
                                  width: 16, height: 16, color: category.color),
                              const SizedBox(width: 6),
                              Text(category.label),
                            ],
                          ),
                        );
                      }).toList(),
                      onChanged: (value) {
                        _selectedCategory = value;
                      },
                      validator: _validateCategory,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: _resetForm,
                      child: const Text(
                          'Reset')), // Using the separate reset function
                  ElevatedButton(
                      onPressed: _saveItem, child: const Text('Add Item')),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
