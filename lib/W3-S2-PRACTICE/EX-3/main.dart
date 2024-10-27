import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Container(
      padding:EdgeInsets.all(20.0),
      color:Colors.grey[350],
      child: Column(
        children: [
          Container(
            padding:EdgeInsets.symmetric(horizontal: 500),
            
            decoration: BoxDecoration(
              color:Colors.blue[100],
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Center(
              child:Text(
                "OOP",
              style: TextStyle(
                color:Colors.white,
                fontSize: 40,
                decoration: TextDecoration.none,
              ),
              )  
            ),
          ),
          Container(
            padding:EdgeInsets.symmetric(horizontal: 500),
            margin: EdgeInsets.symmetric(vertical:20),
            decoration: BoxDecoration(
              color:Colors.blue[300],
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Center(
              child:Text(
                "DART",
              style: TextStyle(
                color:Colors.white,
                fontSize: 40,
                decoration: TextDecoration.none,
              ),
              )  
            ),
          ),
          Container(
            padding:EdgeInsets.symmetric(horizontal: 500),
            
            decoration: BoxDecoration(
              color:Colors.blue[600],
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                colors: [Colors.blue[300]!, Colors.blue[600]!], 
                begin: Alignment.centerLeft, 
                end: Alignment.centerRight, 
              ),
            ),
            child: const Center(
              child:Text(
                "FLUTTER",
              style: TextStyle(
                color:Colors.white,
                fontSize: 40,
                decoration: TextDecoration.none,
              ),
              )  
            ),
          ),
          
             
        ],
      ),
    ),
  ));
}
