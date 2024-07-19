import 'package:flutter/material.dart';
import 'package:flutter_fundamentals/quiz_app/question_answer_list.dart';
import 'package:flutter_fundamentals/quiz_app/result_screen.dart';
import 'common_answer_button.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  int questionAnswerListLength = questionAnswerList1.length;

  var index = 0;

  List<String> answerList = [];

  void storedAnswer({required String answer}) {
    setState(() {
      if (index < questionAnswerListLength - 1) // 5<5
      {
        answerList.add(answer);
        index++;
      } else {
        answerList.add(answer);
        // navigate to result screen.
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ResultScreen(
                answerList: answerList,
              ),
            ));
      }
    });

    print(answerList);
  }

  @override
  Widget build(BuildContext context) {
    var questionAnswerData = questionAnswerList1[index];

    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.deepPurple.shade700,
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Text(questionAnswerData.question,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 26,
                        fontWeight: FontWeight.w400)),
                const SizedBox(
                  height: 30,
                ),
                ...questionAnswerData.answer.map((element) {
                  return AnswerButton(
                    data: element,
                    onPressed: () {
                      storedAnswer(answer: element);
                    },
                  );
                }).toList(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
