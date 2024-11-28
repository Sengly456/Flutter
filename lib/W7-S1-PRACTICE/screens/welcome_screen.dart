import 'package:flutter/material.dart';


class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key,required this. toggle});
  final VoidCallback toggle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          "assets/logos/quiz-logo.png",
          width: 480,
          height: 480,
        ),
        const SizedBox(height: 30),
        const Text(
          "Crazy Quiz",
          style: TextStyle(
            color: Colors.white,
            fontSize: 38,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 30),
        Container(
          width: 250,
          height: 40,
          child: TextButton(
            onPressed: toggle,
            style: const ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(Colors.white),
              
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.arrow_forward,
                  color: Colors.blue,
                  size: 30,
                ),
                SizedBox(width: 15),
                Text(
                  "Start Quiz",
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 25,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
