import 'package:flutter/material.dart';

import 'screens/expenses_screen.dart';
 

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ExpensesScreen(),
    ),
  );
}
