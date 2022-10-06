import 'package:flutter/material.dart';
import 'package:quiz_demo/question.dart';
import 'package:quiz_demo/answers.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var questionIndex = 0;
  List questions = [
    {"question": "How many months make a year",
    "answer": ["one","six","sixteen","twelve"]},
    {"question": "How many planets are in the solar system",
      "answer": ["eight","four","nine","twelve"]},
    {"question": "How many days are in a week",
      "answer": ["nine","two","seven","four"]},
    {"question": "How many hours are in a day",
      "answer": ["twenty-four","ten","three","five"]},
  ];
  void handleClick(){
    setState(() {
      questionIndex++;
    });
  }
  void restartQuiz(){
    setState(() {
      questionIndex = 0;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Quiz app"),
      ),
      body: questionIndex<questions.length?Column(
        children: [
       Question(questions[questionIndex]["question"]),
         ...(questions[questionIndex]["answer"]).map((answer){
           return Answer(handleClick,answer);
         }).toList()
        ],
      ):Center(
        child: Column(
          children: [
            Text(
              "You have completed the quiz",
            ),
            ElevatedButton(
                onPressed: (){
                  restartQuiz();
                }, child: Text("Restart Quiz"))
          ],
        ),
      ),
    );
  }
}

