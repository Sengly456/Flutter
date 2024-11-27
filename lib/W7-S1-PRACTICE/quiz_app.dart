import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:my_app/W7-S1-PRACTICE/screens/question_screen.dart';
import 'package:my_app/W7-S1-PRACTICE/screens/result_screen.dart';
import 'package:my_app/W7-S1-PRACTICE/screens/welcome_screen.dart';
import 'model/quiz.dart';

enum QuizState { notStarted, started, finished }

Color appColor = Colors.blue[500] as Color;

class QuizApp extends StatefulWidget {
  const QuizApp(this.quiz, {super.key});

  final Quiz quiz;

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  QuizState quizState = QuizState.notStarted;

  void startToggle() {
    setState(() {
      quizState = QuizState.started;
    });
  }

  int counter = 0;
  void nextQuestion() {
    setState(() {
      if (counter + 1 < widget.quiz.questions.length) {
        counter++;
      } else {
        quizState = QuizState.finished;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget currentScreen;

    if (quizState == QuizState.notStarted) {
      currentScreen = WelcomeScreen(toggle: startToggle);
    } else if (quizState == QuizState.started) {
      currentScreen = QuestionScreen(
        question: widget.quiz.questions[counter],
        onTap: nextQuestion,
      );
    } else {
      currentScreen = const ResultScreen();
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: appColor,
        body: Center(child: currentScreen),
      ),
    );
  }
}
