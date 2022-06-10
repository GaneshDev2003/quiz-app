import 'package:flutter/material.dart';
import './questions.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questionList;
  final Function answerButtonClicked;
  final int index;
  Quiz(this.index, this.answerButtonClicked, this.questionList);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Question(questionList[index]['question']),
        // ... is a  spread operator. Takes all items in the list and adds them as indivual items. This avoids the usage of nested lists
        ...(questionList[index]['answer'] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(
              answer['text'], () => answerButtonClicked(answer['score']));
        }).toList()
      ],
    );
    // We have mapped the list 'answer' as a list of widgets using map() function
    // toList() is used since dart recognizes the map as an iterable. We need to convert it to a List.
  }
}
