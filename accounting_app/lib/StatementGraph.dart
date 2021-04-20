import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart';

class StatementGraph extends StatefulWidget {
  @override
  _StatementGraphState createState() => _StatementGraphState();
}

class _StatementGraphState extends State<StatementGraph> {
  List<DailyData> weeklyCash;

  List<Series> seriesList;
  _StatementGraphState() {
    this.weeklyCash = [
      DailyData('Sunday', 10),
      DailyData('Monday', 30),
      DailyData('Tuesday', 40),
    ];

    seriesList = [
      Series(id: 'Cash', data: weeklyCash, domainFn: null , measureFn: null)

    ];

  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BarChart(seriesList, animate: false,
        defaultRenderer: new BarRendererConfig(
            groupingType: BarGroupingType.grouped, strokeWidthPx: 2.0),
      ),
    );
  }
}


class DailyData {
  String day;
  int total;

  DailyData(this.day, this.total);
}