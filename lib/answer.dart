import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final String answer;
  final Function updateAnswer;
  Answer(this.answer, this.updateAnswer);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        child: Text(answer),
        onPressed: updateAnswer,
      ),
      height: 50.00,
      width: 100.00,
      margin: EdgeInsets.all(10),
    );
  }
}
