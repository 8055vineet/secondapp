import 'package:flutter/material.dart';
class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData,{super.key});
final List<Map<String,Object>> summaryData;
  @override
  Widget build( context) {
    return SizedBox( height: 250,
      child: SingleChildScrollView(
        child: Column(
          children:summaryData.map((data){
            return Row(//mainAxisAlignment: MainAxisAlignment.center,
              children: [Text(((data['question_index']as int)+1).toString(),textAlign:TextAlign.start),
                Expanded(
                  child: Column(
               children: [Text(data['question'] as String),
               SizedBox(height: 15,),
                   Text(data['correct_answer'] as String),
                   Text(data['user_answer'] as String),

               ],
                  ),
                ),

              ],

            );
          }).toList(),
        ),
      ),
    );


  }
}
