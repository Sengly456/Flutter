import 'package:my_app/W7-S1-PRACTICE/model/quiz.dart';

class Submission {
  final List<Answer> answers;

  const Submission({
    required this.answers,
  });

  void addAnswer(Question question, Answer questionAnswer) {
    answers.add(questionAnswer);
  }

  void removeAnswers() {
    answers.clear();
  }

  int getScore() {
    int score = 0;
    for (var answer in answers) {
      if (answer.isCorrect()) {
        score++;
      }
    }
    ;
    return score;
  }

  String? getAnswerFor(Question question) {
    for (var answer in answers) {
      if (answer.question.title == question.title) {
        return answer.questionAnswer;
      }
    }
    return null;
  }
}

class Answer {
  final String questionAnswer;
  final Question question;

  const Answer({required this.questionAnswer, required this.question});

  bool isCorrect() {
    return question.goodAnswer == questionAnswer;
  }
}
