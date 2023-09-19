import 'package:flutter/material.dart';
import 'package:quizapp/ans_button.dart';
import 'package:quizapp/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class questions extends StatefulWidget {
  const questions({super.key,required this.onselectAnswer});
final void Function(String answer)onselectAnswer;//
  @override
  State<questions> createState() {
    return _questionsState();
  }
}

class _questionsState extends State<questions> {

  var currentQuestionIdx = 0;

  void answerQuestion(String selectedAnswer) {
    widget.onselectAnswer(selectedAnswer);
    setState(() {
      currentQuestionIdx++;
    });
  }

  @override
  Widget build(context) {
    final currentquestion = Questions[currentQuestionIdx];
    return SizedBox(
      width: double.infinity,
      //to take maximum space as possible

      child: Container(
        margin: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentquestion.text,
              style: GoogleFonts.labrada(
                color: Colors.white,
                fontSize: 25,
                letterSpacing: 1,

              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            ...currentquestion.getShuffledAnswers().map((item) {
              return AnswerButton(answerText: item, onTap: (){
                answerQuestion(item);
              });
            }),
          ],
        ),
      ),
    );
  }
}
