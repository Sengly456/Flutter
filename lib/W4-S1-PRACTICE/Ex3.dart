import 'package:flutter/material.dart';

enum BottonType{
  primary,
  secondary,
  disabled
}
enum IconPosition{
  right,
  left,
}

void main() => runApp(MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Custom bottons"),
        ),
        body: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              
            ],
          ),
        ),
      ),
    ));
class CustomButton extends StatelessWidget{
  const CustomButton({super.key,required this.label,required this.icon,this.iconPosition=IconPosition.left,this.bottonType=BottonType.primary});
  final String label;
  final IconData icon;
  final IconPosition iconPosition;
  final BottonType bottonType;
  @override

}