import 'package:flutter/material.dart';
import 'package:quizapp/generateGradiant.dart';
import 'package:quizapp/questions.dart';
import 'package:quizapp/data/questions.dart';
import 'package:quizapp/result_screen.dart';
class quiz extends StatefulWidget {
  const quiz({super.key});

  @override
  State<quiz> createState() {
    return _quizState();
  }
}

class _quizState extends State<quiz> {
 List<String> selectedAnswers=[];//
var activescreen = 'start-screen';

void chooseAnswer(answer){
   selectedAnswers.add(answer);
   if(selectedAnswers.length==Questions.length){
     setState(() {
      // selectedAnswers=[];
       activescreen='results-screen';
     });
   }//
}
  void switchScreen() {
    setState(() {
      activescreen = 'questions-screen';
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget screenWidget = generateGradiant(switchScreen);
    if (activescreen == 'questions-screen') {
      screenWidget = questions(onselectAnswer: chooseAnswer,);
    }
    if (activescreen == 'results-screen') {
      screenWidget =  ResultsScreen(chosenAnswers: selectedAnswers,);
    }

    return MaterialApp(
      home: Scaffold(
          body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.purple.shade500, Colors.purple.shade100])),
        child: screenWidget,
      )),
    );
  }
}
