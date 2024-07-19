import 'package:flutter/material.dart';
import 'package:flutter_fundamentals/quiz_app/question_answer_list.dart';
import 'package:flutter_fundamentals/quiz_app/quiz_model.dart';

class ResultScreen extends StatefulWidget {
  List<String> answerList;

  ResultScreen({super.key, required this.answerList});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  List<QuizModel> questionList = questionAnswerList1;

  List rightAnswer = [
    'Widgets',
    'By combining widgets in a visual editor',
    'Update data as UI changes',
    'StatefulWidget',
    'The UI is not updated',
    'By calling updateUI()',
  ];

  @override
  void initState() {
    checkAnswer();
    super.initState();
  }

  int count = 0;

  bool status = false;

  void checkAnswer() {
    for (int i = 0; i < questionList.length; i++) {
      if (widget.answerList[i] == rightAnswer[i]) {
        count++;
      }

      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        foregroundColor: Colors.white,
        title: Text("Answer Screen"),
      ),
      body: Container(
        color: Colors.deepPurple,
        height: double.infinity,
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: questionList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Card(
                      color: Colors.black,
                      child: Column(
                        children: [
                          Text(questionList[index].question,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 24)),
                          Text(widget.answerList[index],
                              style: TextStyle(
                                  color: widget.answerList[index] ==
                                          rightAnswer[index]
                                      ? Colors.green
                                      : Colors.red,
                                  fontSize: 22)),
                        ],
                      ),
                    ),
                  );
                },
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Your rights is $count from 6",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Text(
                      "Check right answer.",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Spacer(),
                    Transform.scale(
                      scale: 1.5,
                      child: Checkbox(
                        checkColor: Colors.green,
                        shape: RoundedRectangleBorder(),
                        value: status,
                        onChanged: (value) {
                          setState(() {
                            status = value!;
                            print(status);
                          });
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Visibility(
                visible: status,
                child: Container(
                  color: Colors.black,
                  child: Text(
                    '''
     'Widgets',
    'By combining widgets in a visual editor',
    'Update data as UI changes',
    'StatefulWidget',
    'The UI is not updated',
    'By calling updateUI()',
              ''',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
