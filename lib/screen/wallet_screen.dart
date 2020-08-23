import 'dart:math';

import "package:flutter/material.dart";
import 'package:mony_trade/payment.dart';
import 'package:mony_trade/utils/constants.dart';
import 'package:mony_trade/utils/transaction.dart';
import 'package:mony_trade/widget/transaction_widget.dart';

class WalletScreen extends StatefulWidget {
  @override
  _WalletScreenState createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen>
    with TickerProviderStateMixin {
  TabController controller;

  @override
  void initState() {
    controller = TabController(vsync: this, length: 2);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.white12,
                    Colors.white30,
                    Colors.white12,
                    Colors.white30,
                    Colors.transparent,
                    Colors.white30,
                  ],
                  stops: [-.9, .1, .101, .4, .401, 1.2],
                  transform: GradientRotation(pi / 8),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("My Balance", style: kTitleTextStyle),
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Real Account", style: kSubTitleTextStyle),
                          SizedBox(height: 10),
                          Text(
                            "$inr 0",
                            style: TextStyle(
                              color: Colors.blueAccent,
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.white12,
                        radius: 30,
                        child: Icon(Icons.account_balance_wallet,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(height: 50),
                ],
              ),
            ),
            SlideTransition(
              position: AlwaysStoppedAnimation<Offset>(Offset(0.0, -.5)),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: RaisedButton.icon(
                        color: Colors.blueGrey,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        onPressed: () {},
                        icon: Image.asset(
                          "assets/withdraw.png",
                          width: 30,
                          height: 30,
                        ),
                        label: Text("Withdraw"),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: RaisedButton.icon(
                        onPressed: () {
                          deposit(context);
                        },
                        color: Colors.blueAccent,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        icon: Image.asset(
                          "assets/deposit.png",
                          width: 30,
                          height: 30,
                        ),
                        label: Text("Deposit"),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            TabBar(
              controller: controller,
              isScrollable: true,
              unselectedLabelColor: Colors.white54,
              labelColor: Colors.lightGreen,
              indicatorSize: TabBarIndicatorSize.label,
              indicatorColor: Colors.lightGreen,
              tabs: [
                Tab(
                  text: 'Withdraw',
                ),
                Tab(
                  text: 'Deposit',
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: controller,
                children: [
                  ListView(
                    children: [
                      TransactionWidget(
                        transaction: Transaction(
                          amount: 120,
                          state: transactionState.Withdraw,
                          done: false,
                          date: DateTime.now(),
                        ),
                      ),
                      TransactionWidget(
                        transaction: Transaction(
                          amount: 120,
                          state: transactionState.Withdraw,
                          done: true,
                          date: DateTime.now(),
                        ),
                      ),
                      TransactionWidget(
                        transaction: Transaction(
                          amount: 120,
                          state: transactionState.Withdraw,
                          done: true,
                          date: DateTime.now(),
                        ),
                      ),
                    ],
                  ),
                  ListView(
                    children: [
                      TransactionWidget(
                        transaction: Transaction(
                          amount: 120,
                          state: transactionState.Deposit,
                          done: false,
                          date: DateTime.now(),
                        ),
                      ),
                      TransactionWidget(
                        transaction: Transaction(
                          amount: 120,
                          state: transactionState.Deposit,
                          done: false,
                          date: DateTime.now(),
                        ),
                      ),
                      TransactionWidget(
                        transaction: Transaction(
                          amount: 120,
                          state: transactionState.Deposit,
                          done: false,
                          date: DateTime.now(),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
