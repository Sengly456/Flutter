import 'package:flutter/material.dart';

List<String> colors = ["red", "blue", "green"];

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children:  [
            const Label("Method 1: Loop in Array", bold: true),
            // TODO
            for(var i=0;i<colors.length;i++) Text(colors[i]),
            const Label("Method 2: Map", bold: true),
              ...colors.map((color)=>Text(color)).toList(),
            const Label("Method 23: Dedicated Function", bold: true),
            // TODO
              ...getColors(),
          ],
        ),
      ),
    ),
  ));
}
List<Widget> getColors(){
  return colors.map((item)=>Text(item)).toList();
}

class Label extends StatelessWidget {
  const Label(this.text, {super.key, this.bold = false});

  final bool bold;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style:
          TextStyle(fontWeight: (bold ? FontWeight.bold : FontWeight.normal)),
    );
  }
}
