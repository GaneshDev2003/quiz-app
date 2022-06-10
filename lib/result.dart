import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final totalScore;
  final Function restartFunction;
  Result(this.totalScore, this.restartFunction);

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(10),
          child: Text(
            "Congratulations!",
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          )),
      Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(25)),
          color: Colors.amber[300],
        ),
        alignment: Alignment.center,
        padding: EdgeInsets.all(10),
        child: Text(
          "Your final score is : $totalScore",
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
      ),
      TextButton(
          onPressed: restartFunction,
          child: Text(
            'Restart Quiz',
            style: TextStyle(fontSize: 28),
          )),
    ]);
  }
}
