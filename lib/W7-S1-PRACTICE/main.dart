import 'package:flutter/material.dart';
import 'package:my_app/W7-S1-PRACTICE/model/submission.dart';

import 'quiz_app.dart';
import 'model/quiz.dart';

void main() {

  Question q1 = const Question(
      title: "Who is the best teacher?",
      possibleAnswers: ["ronan", "hongly", 'leangsiv'],
      goodAnswer: 'ronan');
  Question q2 = const Question(
      title: "Which color is the best?",
      possibleAnswers: ["blue", "red", 'green'],
      goodAnswer: 'red');
  Question q3 = const Question(
      title: "What is 1+1?",
      possibleAnswers: ["two", "five", 'eight'],
      goodAnswer: 'two');
  Question q4 = const Question(
      title: "what does elon must make?",
      possibleAnswers: ["spaceship", "candy", 'alcohol'],
      goodAnswer: 'spaceship');
  Question q5 = const Question(
      title: "what is the color of orange?",
      possibleAnswers: ["orange", "blue", 'yellow'],
      goodAnswer: 'orange');
  Question q6 = const Question(
      title: "what animal climb tree?",
      possibleAnswers: ["monkey", "dog", 'fish'],
      goodAnswer: 'monkey');
  Question q7 = const Question(
      title: "what food that represent korea?",
      possibleAnswers: ["kimchi", "noodle", 'dumpling'],
      goodAnswer: 'kimchi');
  
  

  List<Question> myQuestions = [q1, q2,q3,q4,q5,q6,q7];
  Quiz myQuiz = Quiz(title: "Crazy Quizz", questions: myQuestions);
  Submission mySubmission = Submission(answers: []);
  runApp(QuizApp(myQuiz,mySubmission));
}
