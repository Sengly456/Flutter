

import 'package:flutter/material.dart';
import 'package:my_app/W7-S1-PRACTICE/model/submission.dart';
import 'package:my_app/W7-S1-PRACTICE/screens/question_screen.dart';
import 'package:my_app/W7-S1-PRACTICE/screens/result_screen.dart';
import 'package:my_app/W7-S1-PRACTICE/screens/welcome_screen.dart';
import 'model/quiz.dart';

enum QuizState { notStarted, started, finished }

Color appColor = Colors.blue[500] as Color;

class QuizApp extends StatefulWidget {
  const QuizApp(this.quiz,this.submission,{super.key});

  final Quiz quiz;
  final Submission submission;


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
  void nextQuestion(String answer){
    widget.submission.addAnswer(widget.quiz.questions[counter], Answer(questionAnswer: answer, question: widget.quiz.questions[counter]));
    setState(() {
      
      if (counter + 1 < widget.quiz.questions.length) {

        counter++;
      } else {
        quizState = QuizState.finished;
      }
    });
  }
  void restart() {
  setState(() {
    widget.submission.removeAnswers(); // Clear all answers
    counter = 0; // Reset the question index
    quizState = QuizState.notStarted; // Return to the Welcome Screen
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
      currentScreen = ResultScreen(submission:widget.submission,quiz:widget.quiz ,restartToggle:restart);
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
