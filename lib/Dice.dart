import 'dart:math';

import 'package:flutter/material.dart';

const String diceImage2 = 'assets/dice/dice-2.png';
const String diceImage4 = 'assets/dice/dice-4.png';

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() => _DiceRollerState();
}

class _DiceRollerState extends State<DiceRoller> {
  void rollDice() {
     //  Display the dice 4 !
     
     int randomNum=Random().nextInt(6)+1;
  setState(() {

      
       activeDiceImage = "assets/dice/dice-$randomNum.png";
  });
  }

String activeDiceImage = diceImage2;

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          activeDiceImage,
          width: 200,
        ),
        const SizedBox(height: 20),
        TextButton(
          onPressed: rollDice,
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            textStyle: const TextStyle(
              fontSize: 28,
            ),
          ),
          child: const Text('Roll Dice'),
        )
      ],
    );
  }
}

void main() => runApp(const MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.deepPurple,
        body: Center(child: DiceRoller()),
      ),
    ));
