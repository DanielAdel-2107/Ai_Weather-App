import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class TempChart extends StatelessWidget {
  const TempChart({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.8,
      child: LineChart(
        LineChartData(
          gridData: FlGridData(show: false),
          titlesData: FlTitlesData(show: false),
          borderData: FlBorderData(
            show: true,
            border: Border.all(color: Colors.white, width: 1),
          ),
          lineBarsData: [
            LineChartBarData(
              spots: [
                FlSpot(0, 20),
                FlSpot(1, 50),
                FlSpot(2, 30),
                FlSpot(3, 80),
                FlSpot(4, 40),
                FlSpot(5, 90),
                FlSpot(6, 60),
              ],
              isCurved: true,
              color: Colors.blue,
              barWidth: 3,
              belowBarData: BarAreaData(
                show: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}