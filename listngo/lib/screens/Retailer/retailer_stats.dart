import 'package:flutter/material.dart';
import 'package:listngo/utilities/graph_data.dart';
import 'package:listngo/utilities/line_chart.dart';

class RetailerStats extends StatefulWidget {
  const RetailerStats({super.key});

  @override
  State<RetailerStats> createState() => _RetailerStatsState();
}

class _RetailerStatsState extends State<RetailerStats> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [LineChartWidget(pricePoints)],
      ),
    );
  }
}
