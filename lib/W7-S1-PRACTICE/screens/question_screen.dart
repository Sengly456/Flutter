import 'package:flutter/material.dart';
import 'package:my_app/W7-S1-PRACTICE/model/quiz.dart';


class QuestionScreen extends StatelessWidget {
  const QuestionScreen(
      {super.key, required this.question, required this.onTap});
  final Question question;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          question.title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 45,
          ),
        ),
        for (int i = 0; i < question.possibleAnswers.length; i++)
          TextButton(
            onPressed: onTap,
            child: Container(
              width: 300,
              margin: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: Colors.blue[100],
              ),
              child: Center(
                child: Text(
                  question.possibleAnswers[i],
                  style:const TextStyle(
                    fontSize:30,
                  ),
                ),
              ),
            ),
          ),
      ],
    );
  }
}
