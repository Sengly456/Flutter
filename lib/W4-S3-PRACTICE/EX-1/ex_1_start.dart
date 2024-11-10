import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Custom buttons"),
        ),
        body: const Center(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MutableButton(),
              MutableButton(),
              MutableButton(),
              MutableButton(),
            ],
          ),
          ),
      ),
    ));

class MutableButton extends StatefulWidget {
  const MutableButton({super.key});

  @override
  State<MutableButton> createState() => _MutableButtonState();
}

class _MutableButtonState extends State<MutableButton> {
  bool isSelected = false;
  String get buttonText => isSelected ? "Selected" : "Not Selected";
  Color get textColor => isSelected ? Colors.white : Colors.black;
  Color get backgroundColor =>
      isSelected ? Colors.blue[500]! : Colors.blue[50]!;

  void toggle() {
    setState(() {
      isSelected = !isSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 100,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: backgroundColor),
          onPressed:toggle,
          child: Center(
            child: Text(
              buttonText,
              
              style: TextStyle(
                fontSize: 30,
                color: textColor,
                
              ),
            ),
          )),
    );
  }
}
