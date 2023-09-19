import 'package:flutter/material.dart';
import 'package:quizapp/data/questions.dart';
import 'package:quizapp/questions_summary.dart';
class ResultsScreen extends StatelessWidget {
  const ResultsScreen({super.key, required this.chosenAnswers}) ;
final List<String> chosenAnswers;
List<Map<String,Object>>getSummaryData(){
  final List<Map<String,Object>> summary=[];
  for(var i=0;i<chosenAnswers.length;i++)
    {
      summary.add(
        {'question_index':i,
          'question':Questions[i].text,
        'correct_answer':Questions[i].answers[0],
        'user_answer':chosenAnswers[i]}
      );
    }
  return summary;
}


  @override
  Widget build(context) {
  final summaryData=getSummaryData();
  final totalQuestion=Questions.length;
  final correctedQuestion=summaryData.where((data){
    return data['correct_answer']==data['user_answer'];
  }).length;


    return SizedBox(
        width: double.infinity,

        child: Container(
          margin: EdgeInsets.all(10),
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
            Text(' $correctedQuestion out of $totalQuestion correct answers'),
            SizedBox(height: 20,),
            QuestionsSummary(getSummaryData()),
            SizedBox(height: 20,),
            TextButton(onPressed: (){}, child: Text('RESTART QUIZ')),
          ]),
        ));
  }
}
