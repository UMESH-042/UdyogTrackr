
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:charts_flutter/flutter.dart' as charts;

class MyGraph extends StatefulWidget {
  @override
  _MyGraphState createState() => _MyGraphState();
}

class _MyGraphState extends State<MyGraph> {
  List<ChartData> _chartData = [];

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  Future<void> _fetchData() async {
    final response = await http.get(Uri.parse('https://flutter-db.000webhostapp.com/graphData.php'));
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      setState(() {
        _chartData = List<ChartData>.from(data.map((item) => ChartData.fromJson(item)));
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Graph'),
      ),
      body: _chartData.isNotEmpty
          ? charts.BarChart(
              [
                charts.Series<ChartData, String>(
                  id: 'Data',
                  domainFn: (ChartData data, _) => data.name,
                  measureFn: (ChartData data, _) => data.value,
                  data: _chartData,
                  labelAccessorFn: (ChartData data, _) => '${data.name}: ${data.value}',
      colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
                ),
              ],
              animate: true,
              barGroupingType: charts.BarGroupingType.grouped,
               behaviors: [
    charts.ChartTitle(
      'My Graph',
      behaviorPosition: charts.BehaviorPosition.top,
      titleOutsideJustification: charts.OutsideJustification.start,
      innerPadding: 18,
    ),
    charts.ChartTitle(
      'Raw Materials',
      behaviorPosition: charts.BehaviorPosition.bottom,
      titleOutsideJustification: charts.OutsideJustification.middleDrawArea,
    ),
    charts.ChartTitle(
      'Quantity',
      behaviorPosition: charts.BehaviorPosition.start,
      titleOutsideJustification: charts.OutsideJustification.middleDrawArea,
    ),
  ],
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}

class ChartData {
  final String name;
  final int value;

  ChartData(this.name, this.value);

  factory ChartData.fromJson(Map<String, dynamic> json) {
    return ChartData(json['name'], int.parse(json['value'] as String));
  }
}
