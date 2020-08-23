import 'package:flutter/material.dart';
import 'package:mony_trade/utils/trade.dart';
import 'package:mony_trade/widget/trade_widget.dart';

class HistoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    DateTime last = DateTime.now();
    List<Widget> list = [];

    Trade.sample.forEach((trd) {
      if (trd.openTime.isBefore(last)) {
        last = DateTime(
          trd.openTime.year,
          trd.openTime.month,
          trd.openTime.day,
        );

        list.add(Text(
            "${trd.openTime.year}/${trd.openTime.month}/${trd.openTime.day}"));
      }

      list.add(TradeWidget(trade: trd));
    });

    return Scaffold(
      appBar: AppBar(title: Text("History"), centerTitle: true),
      body: ListView(
        children: list,
      ),
    );
  }
}
