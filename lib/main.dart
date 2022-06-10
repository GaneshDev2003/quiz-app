import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import './quiz.dart';
import './result.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return (MyAppState());
  }
}

class MyAppState extends State<MyApp> {
  var index = 0;
  var totalScore = 0;
  // ignore: non_constant_identifier_names
  var question_number = 1;
  @override
  Widget build(BuildContext context) {
    const _questionList = [
      {
        'question': 'What is your favourite fruit',
        'answer': [
          {'text': 'Mango', 'score': 20},
          {'text': 'Grapes', 'score': 15},
          {'text': 'Apple', 'score': 5},
          {'text': 'Orange', 'score': 10},
        ]
      },
      {
        'question': 'What is your favourite animal',
        'answer': [
          {'text': 'Doge', 'score': 15},
          {'text': 'Cat', 'score': 5},
          {'text': 'Monke', 'score': 25},
          {'text': 'Birb', 'score': 10},
        ]
      }
    ];
    void answerButtonClicked(int s) {
      setState(() {
        totalScore += s;
        if (index < _questionList.length) {
          index++;
          question_number++;
        }
      });
      print('Answer buton is clicked ');
    }

    void _restartQuiz() {
      setState(() {
        totalScore = 0;
        index = 0;
        question_number = 1;
      });
    }

    return (MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text("Quiz App"),
      ),
      body: index < _questionList.length
          ? Column(
              children: [
                Text("Question : $question_number "),
                Quiz(index, answerButtonClicked, _questionList),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            if (index > 0) index--;
                          });
                        },
                        child: Text("Previous"),
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.green),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10),
                      child: ElevatedButton(
                          onPressed: () => answerButtonClicked(0),
                          child: Text("Next"),
                          style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all<Color>(Colors.green),
                          )),
                    ),
                  ],
                )
              ],
            )
          : Result(totalScore, _restartQuiz),
    )));
  }
}
