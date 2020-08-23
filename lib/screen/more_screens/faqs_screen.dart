import 'package:flutter/material.dart';
import 'package:mony_trade/widget/question_widget.dart';

class FAQsScreen extends StatefulWidget {
  @override
  _FAQsState createState() => _FAQsState();
}

class _FAQsState extends State<FAQsScreen> {
  int numI, numJ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("FAQs")),
      body: ListView(
        children: [
          for (int i = 0; i < questions.length; i++) ...[
            ListTile(
              leading: Icon(Icons.question_answer, color: Colors.blueAccent),
              title: Text(questions.keys.toList()[i]),
            ),
            for (int j = 0; j < questions.values.toList()[i].length; j++)
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: QuestionWidget(
                  question: questions.values.toList()[i].keys.toList()[j],
                  answer: questions.values.toList()[i].values.toList()[j],
                  open: numI == i && numJ == j,
                  onClick: () {
                    setState(() {
                      if (numI == i && numJ == j) {
                        numI = null;
                        numJ = null;
                      } else
                        numI = i;
                      numJ = j;
                    });
                  },
                ),
              ),
          ],
        ],
      ),
    );
  }

  Map<String, Map> questions = <String, Map>{
    "General Question": {
      "1. How to Trade?":
          "First of all. you can start practicing on your practicing account\n"
              "you can study from a course \n"
              "please remember that there is no strategy the works 100%",
      "2.what is the minimum deposit amount?":
          "Minimum deposit amount is RS.100."
    },
    "Deposit Question": {
      "1. How to deposit?":
          "Please go to the \"wallet Page\" and click the deposit button\n"
              "choose or enter the amount you want to deposit\n"
              "and done\n",
    },
    "Withdrawal": {
      "1. How to Withdraw?":
          "Please go to the \"Wallet Page\" and click the withdraw button\n"
              "click withdraw button\n"
              "fill the required data \n"
              "ad we are done",
    },
  }.cast();
}
