import 'package:flutter/material.dart';

void main() => runApp(
      MaterialApp(
        home: Scaffold(
          body: Padding(
            padding: EdgeInsets.only(top: 100),
            child: Column(
              children: [
                Container(
                  color: Colors.blue,
                  height: 400,
                ),
                Container(
                  height: 100,
                  child: Row(
                    children: [
                      Expanded(child: Container(color: Colors.green)),
                      Container(color: Colors.pink, width: 100)
                    ],
                  ),
                ),
                Container(
                  height: 100,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween.,
                    children: [
                      Container(color: Colors.yellow,width:100),
                      Container(color: Colors.yellow,width:100),
                      Container(color: Colors.yellow,width:100),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
