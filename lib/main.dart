import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // backgroundColor: Colors.blueGrey[900],
        backgroundColor: Colors.grey[850],
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: QuizBody(),
          ),
        ),
      ),
    );
  }
}

class QuizBody extends StatefulWidget {
  @override
  _QuizBodyState createState() => _QuizBodyState();
}

class _QuizBodyState extends State<QuizBody> {
  List<Icon> iconList = [];
  List<String> questionList = [
    'You can lead a cow down stairs but not up stairs.',
    'Approximately one quarter of human bones are in the feet.',
    'A slug\'s blood is green.',
    'You can lead a cow down stairs but not up stairs.',
    'Approximately one quarter of human bones are in the feet.',
    'A slug\'s blood is green.',
  ];
  int questionNumber = 0;

  List<bool> answer = [false, true, true, false, true, true];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                questionList[questionNumber],
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25.0,
                ),
              ),
            ),
          ),
        ),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: FlatButton(
            color: Colors.green,
            child: Text('True'),
            onPressed: () {
              bool correctAnswer = answer[questionNumber];


              setState(() {
                if (correctAnswer == true) {
                  iconList.add(Icon(
                    Icons.check,
                    color: Colors.green[500],
                  ));
                } else {
                  iconList.add(Icon(
                    Icons.close,
                    color: Colors.red,
                  ));
                }

                questionNumber++;
              });
            },
          ),
        )),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: FlatButton(
              color: Colors.red,
              child: Text('False'),
              onPressed: () {
                bool correctAnswer = answer[questionNumber];
                setState(() {

                   if (correctAnswer == false) {
                  iconList.add(Icon(
                    Icons.check,
                    color: Colors.green[500],
                  ));
                } else {
                  iconList.add(Icon(
                    Icons.close,
                    color: Colors.red,
                  ));
                }
                  questionNumber++;
                });
              },
            ),
          ),
        ),
        Row(
          children: iconList,
        ),
      ],
    );
  }
}

/*
question1: 'You can lead a cow down stairs but not up stairs.', false,
question2: 'Approximately one quarter of human bones are in the feet.', true,
question3: 'A slug\'s blood is green.', true,
*/
