import 'package:flutter/material.dart';

class AnswerButton extends StatefulWidget {
  void Function()? onPressed;
  String data;

  AnswerButton({super.key, required this.data, required this.onPressed});

  @override
  State<AnswerButton> createState() => _AnswerButtonState();
}

class _AnswerButtonState extends State<AnswerButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        fixedSize: Size(300, 40),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18)
        )
      ),
        onPressed: widget.onPressed, child: Text(widget.data),
    );
  }
}
