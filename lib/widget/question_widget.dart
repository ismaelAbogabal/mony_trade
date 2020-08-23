import 'package:flutter/material.dart';

class QuestionWidget extends StatelessWidget {
  final String question, answer;
  final bool open;
  final Function onClick;

  const QuestionWidget(
      {Key key, this.question, this.answer, this.open, this.onClick})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          GestureDetector(
            onTap: onClick,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(question),
                Icon(
                  open ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                ),
              ],
            ),
          ),
          if (open)
            Container(
              padding: EdgeInsets.all(10),
              color: Colors.black12,
              child: Text(answer),
            ),
        ],
      ),
    );
  }
}
