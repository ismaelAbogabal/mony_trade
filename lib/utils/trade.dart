import 'package:flutter/material.dart';

class Trade {
  String id;
  int amount;
  double profit;
  String asset;
  Widget icon;
  double openValue, closeValue;
  DateTime openTime, closeTime;
  bool up;
  double earning;

  Trade({
    this.id,
    this.amount,
    this.profit,
    this.icon,
    this.asset,
    this.openValue,
    this.closeValue,
    this.openTime,
    this.closeTime,
    this.up,
    this.earning,
  });

  static List<Trade> sample = [
    Trade(
      icon: Image.asset("assets/logo.png", width: 30, height: 30),
      amount: 1000,
      profit: .75,
      earning: 1750,
      asset: "USD/UER",
      id: "asdaf",
      up: true,
      closeTime: DateTime(2020, 8, 20, 4, 0),
      openTime: DateTime(2020, 8, 20, 9, 59),
      openValue: 1235.01,
      closeValue: 1236.01,
    ),
    Trade(
      icon: Image.asset("assets/logo.png", width: 30, height: 30),
      amount: 1000,
      profit: .75,
      earning: 0,
      asset: "USD/UER",
      id: "asdgg",
      up: false,
      closeTime: DateTime(2020, 8, 20, 3, 50),
      openTime: DateTime(2020, 8, 20, 3, 49),
      openValue: 1235.01,
      closeValue: 2323.01,
    ),
    Trade(
      icon: Image.asset("assets/logo.png", width: 30, height: 30),
      amount: 1000,
      profit: .75,
      earning: 1750,
      asset: "USD/UER",
      id: "asdaf",
      up: false,
      closeTime: DateTime(2020, 8, 20, 4, 0),
      openTime: DateTime(2020, 8, 20, 9, 59),
      openValue: 1235.01,
      closeValue: 1234.01,
    ),
  ];
}
