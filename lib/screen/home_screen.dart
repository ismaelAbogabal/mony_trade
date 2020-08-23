import 'package:flutter/material.dart';
import 'package:mony_trade/screen/history_screen.dart';
import 'package:mony_trade/screen/more_screen.dart';
import 'package:mony_trade/screen/trade_screen.dart';
import 'package:mony_trade/screen/wallet_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 1;

  get getPage {
    switch (index) {
      case 0:
        return HistoryScreen();
        break;
      case 1:
        return TradeScreen();
        break;
      case 2:
        return WalletScreen();
        break;
      case 3:
        return MoreScreen();
        break;
      default:
        return Placeholder();
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: getPage,
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          onTap: (value) => setState(() => index = value),
          currentIndex: index,
          selectedIconTheme: IconThemeData(size: 30),
          selectedItemColor: Colors.greenAccent,
          unselectedItemColor: Colors.white30,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          elevation: 6,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.history),
              title: Text("History"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.insert_chart),
              title: Text("Trade"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.account_balance_wallet),
              title: Text("Wallet"),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.layers),
              title: Text("More"),
            ),
          ],
        ),
      ),
    );
  }
}
