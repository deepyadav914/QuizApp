import 'package:flutter/material.dart';
import 'package:flutter_fundamentals/quiz_app/question_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.deepPurple.shade700,
          child: Column(
            children: [
              const Spacer(),
              const Opacity(
                opacity: 0.8,
                child: Image(
                  image: AssetImage("assets/images/quiz_app_.png"),
                ),
              ),
              const SizedBox(
                height: 100,
              ),
              const Text("Learn flutter the fun away.",
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 23,
                      fontWeight: FontWeight.w400)),
              const SizedBox(
                height: 40,
              ),
              OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const QuestionScreen(),
                        ));
                  },
                  icon: const Icon(Icons.navigate_next_sharp, color: Colors.white),
                  label: const Text(
                    "Start Quiz",
                    style: TextStyle(color: Colors.white),
                  )),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
