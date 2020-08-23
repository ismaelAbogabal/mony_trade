import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class ChartDrawerWidget extends StatefulWidget {
  @override
  _ChartDrawerWidgetState createState() => _ChartDrawerWidgetState();
}

class _ChartDrawerWidgetState extends State<ChartDrawerWidget> {
  List l = [];
  Random random = Random();
  @override
  Widget build(BuildContext context) {
    l.clear();
    l.add(60);
    for (int i = 0; i < 100; i++) {
      int val = random.nextInt(50) - 25;
      l.add(val + l[i]);
    }
    return LineChart(
      LineChartData(
        borderData: FlBorderData(show: false),
        titlesData: FlTitlesData(
          leftTitles: SideTitles(showTitles: false),
          rightTitles: SideTitles(
            showTitles: true,
            getTitles: (value) => "$value",
            reservedSize: 50,
            interval: 30,
            textStyle: TextStyle(
              color: Colors.white30,
              fontSize: 12,
            ),
          ),
          bottomTitles: SideTitles(
            showTitles: true,
            getTitles: (value) => "${value.toStringAsFixed(0)}",
//            reservedSize: 50,
            interval: 30,
            textStyle: TextStyle(
              color: Colors.white30,
              fontSize: 12,
            ),
          ),
        ),
        gridData: FlGridData(
          drawHorizontalLine: true,
          getDrawingHorizontalLine: (value) => FlLine(
            color: Colors.white30,
            strokeWidth: .5,
          ),
        ),
        lineTouchData: LineTouchData(
          touchTooltipData: LineTouchTooltipData(
            tooltipBgColor: Colors.black38,
            tooltipRoundedRadius: 100,
          ),
        ),
        lineBarsData: [
          LineChartBarData(
            spots: [
              for (int i = 0; i < l.length; i++) FlSpot(i.toDouble(), l[i] / 1),
            ],
            colors: [Colors.green, Colors.white60],
            barWidth: 1.5,
            dotData: FlDotData(show: false),
            isStrokeCapRound: true,
            belowBarData: BarAreaData(
              show: true,
              colors: [Colors.transparent, Colors.green],
              gradientColorStops: [0.0, 1.0],
              gradientFrom: Offset(.5, 1),
              gradientTo: Offset(.5, 0),
              spotsLine: BarAreaSpotsLine(
                show: true,
                checkToShowSpotLine: (spot) => spot.x == 100,
                flLineStyle: FlLine(
                  color: Colors.redAccent,
                  dashArray: [10],
                ),
              ),
            ),
          ),
          LineChartBarData(
            spots: [
              for (int i = 0; i < l.length; i++)
                FlSpot(i.toDouble(), l[i] + 20.0),
            ],
            show: false,
          ),
          LineChartBarData(
            spots: [
              for (int i = 0; i < l.length; i++)
                FlSpot(i.toDouble(), l[i] - 20.0),
            ],
            show: false,
          ),
        ],
      ),
    );
  }
}
