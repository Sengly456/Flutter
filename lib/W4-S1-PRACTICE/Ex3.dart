import 'package:flutter/material.dart';

enum BottonType {
  primary,
  secondary,
  disabled,
}

enum IconPosition {
  right,
  left,
}

void main() => runApp(MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Custom Buttons"),
        ),
        body: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            children: [
              CustomButton(
                label: 'Primary Button',
                icon: Icons.check,
                bottonType: BottonType.primary,
              ),
              SizedBox(height: 10),
              CustomButton(
                label: 'Secondary Button',
                icon: Icons.access_time,
                bottonType: BottonType.secondary,
                iconPosition: IconPosition.right,
              ),
              SizedBox(height: 10),
              CustomButton(
                label: 'Disabled Button',
                icon: Icons.account_circle,
                bottonType: BottonType.disabled,
              ),
            ],
          ),
        ),
      ),
    ));

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.label,
    required this.icon,
    this.iconPosition = IconPosition.left,
    this.bottonType = BottonType.primary,
  });

  final String label;
  final IconData icon;
  final IconPosition iconPosition;
  final BottonType bottonType;

  @override
  Widget build(BuildContext context) {
    // Customize appearance based on button type
    Color backgroundColor;
    Color textColor;
    if (bottonType == BottonType.primary) {
      backgroundColor = Colors.blue;
      textColor = Colors.white;
    } else if (bottonType == BottonType.secondary) {
      backgroundColor = Colors.green;
      textColor = Colors.black;
    } else {
      backgroundColor = Colors.grey;
      textColor = Colors.white.withOpacity(0.5);
    }
    if (iconPosition == IconPosition.left) {
      Alignment.centerLeft;
    } else {
      Alignment.centerRight;
    }

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.only(bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        color:backgroundColor
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: iconPosition == IconPosition.left
            ? [
                Icon(icon, color: textColor),
                const SizedBox(width: 8),
                Text(
                  label,
                  style: TextStyle(color: textColor, fontSize: 16),
                ),
              ]
            : [
                Text(
                  label,
                  style: TextStyle(color: textColor, fontSize: 16),
                ),
                const SizedBox(width: 8),
                Icon(icon, color: textColor),
              ],
      ),
    );
  }
}
