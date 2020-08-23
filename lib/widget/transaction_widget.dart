import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mony_trade/utils/constants.dart';
import 'package:mony_trade/utils/transaction.dart';

class TransactionWidget extends StatelessWidget {
  final Transaction transaction;

  const TransactionWidget({Key key, this.transaction}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white12,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(5),
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
      child: ListTile(
        leading: Image.asset(
          transaction.state == transactionState.Deposit
              ? "assets/deposit.png"
              : "assets/withdraw.png",
          height: 40,
          width: 40,
        ),
        title: Text(transaction.stateString),
        subtitle: FittedBox(
            child:
                Text(DateFormat("dd/MM/y, HH:mm:s").format(transaction.date))),
        trailing: Container(
          width: 100,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("$inr${transaction.amount}", style: kMoneyTextStyle),
              SizedBox(height: 10),
              Text(transaction.done ? "Done" : "Failed"),
            ],
          ),
        ),
      ),
    );
  }
}
