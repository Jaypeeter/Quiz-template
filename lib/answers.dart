import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  Function handleEvent;
  String answer;

  Answer(this.handleEvent,this.answer);

  @override
  Widget build(BuildContext context) {
    return  Container(
    width: double.infinity,
    child: ElevatedButton(
  onPressed: (){
  handleEvent();
  },
  child: Text(answer)),
  );
  }
}
