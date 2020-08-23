import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mony_trade/utils/constants.dart';
import 'package:mony_trade/widget/chart_drawer.dart';
import 'package:mony_trade/widget/time_scale_widget.dart';

class TradeScreen extends StatefulWidget {
  @override
  _TradeScreenState createState() => _TradeScreenState();
}

class _TradeScreenState extends State<TradeScreen> {
  deposit() {}

  int timeScale = 5;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          accountChooser(),
          assetChooser(),
          timeScaleChooser(),
          Expanded(
            child: ChartDrawerWidget(),
          ),
          investInTimeRow(),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton.icon(
                    padding: const EdgeInsets.all(12.0),
                    color: Colors.redAccent,
                    onPressed: () {},
                    icon: Icon(Icons.arrow_downward),
                    label: Text("Down"),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: RaisedButton.icon(
                    padding: const EdgeInsets.all(12.0),
                    color: Colors.greenAccent,
                    onPressed: () {},
                    icon: Icon(Icons.arrow_upward),
                    label: Text("Up"),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Row timeScaleChooser() {
    return Row(
      children: [
        TimeScaleWidget<int>(
          child: Text("1H"),
          value: 60,
          groupValue: timeScale,
          onClick: (i) => setState(() => timeScale = i),
        ),
        TimeScaleWidget<int>(
          child: Text("30m"),
          value: 30,
          groupValue: timeScale,
          onClick: (i) => setState(() => timeScale = i),
        ),
        TimeScaleWidget<int>(
          child: Text("15m"),
          value: 15,
          groupValue: timeScale,
          onClick: (i) => setState(() => timeScale = i),
        ),
        TimeScaleWidget<int>(
          child: Text("5m"),
          value: 5,
          groupValue: timeScale,
          onClick: (i) => setState(() => timeScale = i),
        ),
      ],
    );
  }

  Row investInTimeRow() {
    return Row(
      children: [
        Expanded(
          child: Container(
            color: Colors.white12,
            margin: EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("invest"),
                IconButton(
                  icon: Icon(Icons.remove_circle_outline),
                  onPressed: () {},
                ),
                Text("10 $inr", style: kMoneyTextStyle),
                IconButton(
                  icon: Icon(Icons.add_circle_outline),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            color: Colors.white12,
            margin: EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Time"),
                IconButton(
                  icon: Icon(Icons.remove_circle_outline),
                  onPressed: () {},
                ),
                Text("1 m", style: kMoneyTextStyle),
                IconButton(
                  icon: Icon(Icons.add_circle_outline),
                  onPressed: () {},
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Row assetChooser() {
    return Row(
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton(
              color: Colors.white12,
              onPressed: () {},
              child: FittedBox(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text("Asset  "),
                    Image.network(
                      "https://images-na.ssl-images-amazon.com/images/I/51X6xInWHcL._AC_SX466_.jpg",
                      height: 20,
                      width: 30,
                      fit: BoxFit.fill,
                    ),
                    Text("  URE/USD"),
                    Icon(Icons.arrow_drop_down),
                  ],
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton(
              color: Colors.white12,
              onPressed: () {},
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(text: "Profit"),
                    TextSpan(text: "   10%", style: kMoneyTextStyle),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  GlobalKey<PopupMenuButtonState> key = GlobalKey<PopupMenuButtonState>();
  Padding accountChooser() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              key.currentState.showButtonMenu();
            },
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(text: "Account name \n"),
                  TextSpan(
                    text: "0 $inr",
                    style: kMoneyTextStyle,
                  ),
                  WidgetSpan(
                    child: PopupMenuButton(
                      key: key,
                      child: Icon(Icons.arrow_drop_down),
                      itemBuilder: (ctx) => [
                        PopupMenuItem(
                          value: 1,
                          child: Container(
                            child: ListTile(
                              title: Text("Real Account"),
                              subtitle:
                                  Text("$inr 0.0", style: kMoneyTextStyle),
                            ),
                          ),
                        ),
                        PopupMenuItem(
                          value: 1,
                          child: ListTile(
                            title: Text("Practical Account"),
                            subtitle:
                                Text("$inr 1000.0", style: kMoneyTextStyle),
                            selected: true,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          RaisedButton(
            onPressed: deposit,
            child: Text("Deposit"),
          ),
        ],
      ),
    );
  }
}
