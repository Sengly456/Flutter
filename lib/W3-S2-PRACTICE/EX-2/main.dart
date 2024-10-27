import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.all(50.0), // Adjusted margin
          padding: EdgeInsets.all(20.0), // Adjusted padding
          color: Colors.blue[300],
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blue[600],
              borderRadius: BorderRadius.circular(20.0),
            ),
            
            child: Center(
              child: Text(
                "CADT STUDENTS",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  ));
}
