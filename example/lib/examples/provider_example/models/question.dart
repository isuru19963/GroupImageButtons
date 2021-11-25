import 'package:flutter/foundation.dart';

class Question {
  const Question(this.title, this.answers, this.userAnswers, this.answerTitles);

  final String title;
  final List<String> answerTitles;
  final List<bool> answers;
  final List<bool> userAnswers;

  void updateAnsver(int index, {bool value}) {
    userAnswers[index] = value;
  }

  List<int> get selectedIndexes {
    final indexes = <int>[];
    for (var i = 0; i < userAnswers.length; i++) {
      if (userAnswers[i]) {
        indexes.add(i);
      }
    }
    return indexes;
  }

  @override
  String toString() {
    return 'Question(title: $title, answerTitles: $answerTitles, answers: $answers, userAnswers: $userAnswers)';
  }

  bool get result {
    return listEquals(answers, userAnswers);
  }
}
