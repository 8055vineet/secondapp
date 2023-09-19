import 'package:flutter/material.dart';

class generateGradiant extends StatelessWidget {
  const generateGradiant(this.quiz,{super.key});
  final void Function() quiz;


  @override
  Widget build(context) {
    return Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'assets/images/quiz-logo.png',height:300,width: 400,
              color: const Color.fromRGBO(255, 255, 255, 0.8),
            ),
           const Padding(padding: EdgeInsets.only(top: 60),),
            const Text(
              "Learn Flutter in fun way",
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              height: 20,
            ),
            OutlinedButton.icon(
              onPressed:quiz,
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
              ),
              icon:Icon(Icons.arrow_right_alt_outlined),
              label: Text('Start QUIZZ'),
            )
          ],
        ),
      );

  }
}
