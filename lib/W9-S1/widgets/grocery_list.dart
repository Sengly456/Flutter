import 'package:flutter/material.dart';
import 'package:my_app/W9-S1/models/grocery_item.dart';
import '../data/dummy_items.dart';

class GroceryList extends StatefulWidget {
  const GroceryList({super.key});

  @override
  State<GroceryList> createState() => _GroceryListState();
}

class _GroceryListState extends State<GroceryList> {
  @override
  Widget build(BuildContext context) {
    Widget content = const Center(child: Text('No items added yet.'));

    if (dummyGroceryItems.isNotEmpty) {
       content = ListView.builder(
        itemCount:dummyGroceryItems.length ,
        itemBuilder:(BuildContext context, int index){
          GroceryItem item = dummyGroceryItems[index];
          return ListTile(
            leading: Container(
              width:24,
              height:24,
              color: item.category.color,
            ),
            title: Text(item.category.label),
            trailing:Text(
              "${item.quantity}"
            ) ,
            

          );
        } 
        
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Groceries'),
        actions: [
          IconButton(
            onPressed: () => {},
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: content,
    );
  }
}

extension on List<GroceryItem> {
  get category => null;
}
