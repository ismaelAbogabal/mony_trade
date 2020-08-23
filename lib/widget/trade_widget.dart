import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mony_trade/utils/constants.dart';
import 'package:mony_trade/utils/trade.dart';

class TradeWidget extends StatelessWidget {
  final Trade trade;

  const TradeWidget({Key key, this.trade}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white12,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [trade.icon, Text(trade.asset)],
              ),
              Text("${trade.profit * 100}% Profit",style: kMoneyTextStyle),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: 15,
                    child: trade.up
                        ? Icon(Icons.arrow_upward, color: Colors.white)
                        : Icon(Icons.arrow_downward, color: Colors.white),
                    backgroundColor: trade.up ? Colors.green : Colors.redAccent,
                  ),
                  SizedBox(width: 5),
                  Text(trade.openValue.toString()),
                ],
              ),
            ],
          ),
          SizedBox(height: 15),
          Row(
            children: [
              Text("Opening   ",style: kLightTextStyle),
              Expanded(
                child: Text(
                    "${trade.openValue} | ${DateFormat.Hms().format(trade.openTime)}"),
              ),
              Text("Earning ",style: kLightTextStyle),
            ],
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Text("Closing   ",style: kLightTextStyle),
              Expanded(
                child: Text(
                    "${trade.closeValue} | ${DateFormat.Hms().format(trade.closeTime)}"),
              ),
              Text("${trade.earning}  $inr  ",style: kMoneyTextStyle),
            ],
          ),
          SizedBox(height: 8),
        ],
      ),
    );
  }
}
