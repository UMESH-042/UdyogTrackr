
// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:charts_flutter/flutter.dart' as charts;

// class MyGraph extends StatefulWidget {
//   @override
//   _MyGraphState createState() => _MyGraphState();
// }

// class _MyGraphState extends State<MyGraph> {
//   List<ChartData> _chartData = [];

//   @override
//   void initState() {
//     super.initState();
//     _fetchData();
//   }

//   Future<void> _fetchData() async {
//     final response = await http.get(Uri.parse('https://flutter-db.000webhostapp.com/graphData.php'));
//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);
//       setState(() {
//         _chartData = List<ChartData>.from(data.map((item) => ChartData.fromJson(item)));
//       });
//     } else {
//       throw Exception('Failed to load data');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('My Graph'),
//       ),
//       body: _chartData.isNotEmpty
//           ? charts.BarChart(
//               [
//                 charts.Series<ChartData, String>(
//                   id: 'Data',
//                   domainFn: (ChartData data, _) => data.name,
//                   measureFn: (ChartData data, _) => data.value,
//                   data: _chartData,
//                   labelAccessorFn: (ChartData data, _) => '${data.name}: ${data.value}',
//       colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
//                 ),
//               ],
//               animate: true,
//               barGroupingType: charts.BarGroupingType.grouped,
//                behaviors: [
//     charts.ChartTitle(
//       'My Graph',
//       behaviorPosition: charts.BehaviorPosition.top,
//       titleOutsideJustification: charts.OutsideJustification.start,
//       innerPadding: 18,
//     ),
//     charts.ChartTitle(
//       'Raw Materials',
//       behaviorPosition: charts.BehaviorPosition.bottom,
//       titleOutsideJustification: charts.OutsideJustification.middleDrawArea,
//     ),
//     charts.ChartTitle(
//       'Quantity',
//       behaviorPosition: charts.BehaviorPosition.start,
//       titleOutsideJustification: charts.OutsideJustification.middleDrawArea,
//     ),
//   ],
//             )
//           : Center(child: CircularProgressIndicator()),
//     );
//   }
// }

// class ChartData {
//   final String name;
//   final int value;

//   ChartData(this.name, this.value);

//   factory ChartData.fromJson(Map<String, dynamic> json) {
//     return ChartData(json['name'], int.parse(json['value'] as String));
//   }
// }

// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:charts_flutter/flutter.dart' as charts;

// class MyGraph extends StatefulWidget {
//   @override
//   _MyGraphState createState() => _MyGraphState();
// }

// class _MyGraphState extends State<MyGraph> {
//   List<ChartData> _chartData = [];

//   @override
//   void initState() {
//     super.initState();
//     _fetchData();
//   }

//   Future<void> _fetchData() async {
//     final response = await http.get(Uri.parse('https://flutter-db.000webhostapp.com/graphData.php'));
//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);
//       setState(() {
//         _chartData = List<ChartData>.from(data.map((item) => ChartData.fromJson(item)));
//       });

//       // Check if any value exceeds 100 and show a notification
//       bool showNotification = _chartData.any((item) => item.value > 100);
//       if (showNotification) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(
//             content: Text('A value has exceeded 100!'),
//           ),
//         );
//       }
//     } else {
//       throw Exception('Failed to load data');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('My Graph'),
//       ),
//       body: _chartData.isNotEmpty
//           ? charts.BarChart(
//               [
//                 charts.Series<ChartData, String>(
//                   id: 'Data',
//                   domainFn: (ChartData data, _) => data.name,
//                   measureFn: (ChartData data, _) => data.value,
//                   data: _chartData,
//                   labelAccessorFn: (ChartData data, _) => '${data.name}: ${data.value}',
//                   colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
//                 ),
//               ],
//               animate: true,
//               barGroupingType: charts.BarGroupingType.grouped,
//               behaviors: [
//                 charts.ChartTitle(
//                   'My Graph',
//                   behaviorPosition: charts.BehaviorPosition.top,
//                   titleOutsideJustification: charts.OutsideJustification.start,
//                   innerPadding: 18,
//                 ),
//                 charts.ChartTitle(
//                   'Raw Materials',
//                   behaviorPosition: charts.BehaviorPosition.bottom,
//                   titleOutsideJustification: charts.OutsideJustification.middleDrawArea,
                  
//                 ),
//                 charts.ChartTitle(
//                   'Quantity',
//                   behaviorPosition: charts.BehaviorPosition.start,
//                   titleOutsideJustification: charts.OutsideJustification.middleDrawArea,
//                 ),
//               ],
//             )
//           : Center(child: CircularProgressIndicator()),
//     );
//   }
// }

// class ChartData {
//   final String name;
//   final int value;

//   ChartData(this.name, this.value);

//   factory ChartData.fromJson(Map<String, dynamic> json) {
//     return ChartData(json['name'], int.parse(json['value'] as String));
//   }
// }

// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:charts_flutter/flutter.dart' as charts;

// class MyGraph extends StatefulWidget {
//   @override
//   _MyGraphState createState() => _MyGraphState();
// }

// class _MyGraphState extends State<MyGraph> {
//   List<ChartData> _chartData = [];
//   bool _notificationFlag = false;

//   @override
//   void initState() {
//     super.initState();
//     _fetchData();
//   }

//   Future<void> _fetchData() async {
//     final response = await http.get(Uri.parse('https://flutter-db.000webhostapp.com/graphData.php'));
//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);
//       setState(() {
//         _chartData = List<ChartData>.from(data.map((item) => ChartData.fromJson(item)));
//       });

//       // Check if any value exceeds 100 and set notification flag
//       bool showNotification = _chartData.any((item) => item.value > 100);
//       setState(() {
//         _notificationFlag = showNotification;
//       });
//     } else {
//       throw Exception('Failed to load data');
//     }
//   }

//   void _showNotificationDialog(BuildContext context) {
//       final ChartData chartData = _chartData.firstWhere((item) => item.value > 100);
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text('Notification'),
//         content: Text('${chartData.name} has exceeded 100!'),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: Text('OK'),
//           ),
//         ],
//       ),
//     );
//     // Set notification flag to false after showing the dialog
//     setState(() {
//       _notificationFlag = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('My Graph'),
//         actions: [
//           if (_notificationFlag)
//             IconButton(
//               onPressed: () => _showNotificationDialog(context),
//               icon: Icon(Icons.notifications),
//             ),
//         ],
//       ),
//       body: _chartData.isNotEmpty
//           ? charts.BarChart(
//               [
//                 charts.Series<ChartData, String>(
//                   id: 'Data',
//                   domainFn: (ChartData data, _) => data.name,
//                   measureFn: (ChartData data, _) => data.value,
//                   data: _chartData,
//                   labelAccessorFn: (ChartData data, _) => '${data.name}: ${data.value}',
//                   colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
//                 ),
//               ],
//               animate: true,
//               barGroupingType: charts.BarGroupingType.grouped,
//               behaviors: [
//                 charts.ChartTitle(
//                   'My Graph',
//                   behaviorPosition: charts.BehaviorPosition.top,
//                   titleOutsideJustification: charts.OutsideJustification.start,
//                   innerPadding: 18,
//                 ),
//                 charts.ChartTitle(
//                   'Raw Materials',
//                   behaviorPosition: charts.BehaviorPosition.bottom,
//                   titleOutsideJustification: charts.OutsideJustification.middleDrawArea,
                  
//                 ),
//                 charts.ChartTitle(
//                   'Quantity',
//                   behaviorPosition: charts.BehaviorPosition.start,
//                   titleOutsideJustification: charts.OutsideJustification.middleDrawArea,
//                 ),
//               ],
//             )
//           : Center(child: CircularProgressIndicator()),
//     );
//   }
// }


// class ChartData {
//   final String name;
//   final int value;

//   ChartData(this.name, this.value);

//   factory ChartData.fromJson(Map<String, dynamic> json) {
//     return ChartData(json['name'], int.parse(json['value'] as String));
//   }
// }



// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:charts_flutter/flutter.dart' as charts;

// import 'notificationpage.dart';

// class MyGraph extends StatefulWidget {
//   @override
//   _MyGraphState createState() => _MyGraphState();
// }

// class _MyGraphState extends State<MyGraph> {
//   List<ChartData> _chartData = [];
//   Set<String> _exceededNames = {};

//   @override
//   void initState() {
//     super.initState();
//     _fetchData();
//   }

//   Future<void> _fetchData() async {
//     final response = await http.get(Uri.parse('https://flutter-db.000webhostapp.com/graphData.php'));
//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);
//       setState(() {
//         _chartData = List<ChartData>.from(data.map((item) => ChartData.fromJson(item)));
//       });

//       // Check if any value exceeds 100 and add name to set of exceeded names
//       Set<String> exceededNames = Set<String>.from(_chartData.where((item) => item.value > 100).map((item) => item.name));
//       setState(() {
//         _exceededNames = exceededNames;
//       });
//     } else {
//       throw Exception('Failed to load data');
//     }
//   }

//  void _showNotification(BuildContext context, String name) {
//   _exceededNames.remove(name); // Remove name from set of exceeded names

//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: Text('Exceeded limit for $name'),
//         content: SizedBox(
//           height: 200,
//           child: ListView(
//             children: _exceededNames.map((name) => ListTile(title: Text(name))).toList(),
//           ),
//         ),
//         actions: <Widget>[
//           TextButton(
//             child: Text('OK'),
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//           ),
//         ],
//       );
//     },
//   );
// }



//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('My Graph'),
//         actions: [
//           if (_exceededNames.isNotEmpty)
//            IconButton(
//   onPressed: () => _showNotification(context, ''),
//   icon: Icon(Icons.notifications),
// ),
//         ],
//       ),
//       body: _chartData.isNotEmpty
//           ? charts.BarChart(
//               [
//                 charts.Series<ChartData, String>(
//                   id: 'Data',
//                   domainFn: (ChartData data, _) => data.name,
//                   measureFn: (ChartData data, _) => data.value,
//                   data: _chartData,
//                   labelAccessorFn: (ChartData data, _) => '${data.name}: ${data.value}',
//                   colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
//                 ),
//               ],
//               animate: true,
//               barGroupingType: charts.BarGroupingType.grouped,
//               behaviors: [
//                 charts.ChartTitle(
//                   'My Graph',
//                   behaviorPosition: charts.BehaviorPosition.top,
//                   titleOutsideJustification: charts.OutsideJustification.start,
//                   innerPadding: 18,
//                 ),
//                 charts.ChartTitle(
//                   'Raw Materials',
//                   behaviorPosition: charts.BehaviorPosition.bottom,
//                   titleOutsideJustification: charts.OutsideJustification.middleDrawArea,
                  
//                 ),
//                 charts.ChartTitle(
//                   'Quantity',
//                   behaviorPosition: charts.BehaviorPosition.start,
//                   titleOutsideJustification: charts.OutsideJustification.middleDrawArea,
//                 ),
//               ],
//             )
//           : Center(child: CircularProgressIndicator()),
//     );
//   }
// }

// class ChartData {
//   final String name;
//   final int value;

//   ChartData(this.name, this.value);

//   factory ChartData.fromJson(Map<String, dynamic> json) {
//     return ChartData(json['name'], int.parse(json['value'] as String));
//   }
// }


import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:charts_flutter/flutter.dart' as charts;

import 'notificationpage.dart';

class MyGraph extends StatefulWidget {
  @override
  _MyGraphState createState() => _MyGraphState();
}

class _MyGraphState extends State<MyGraph> {
  List<ChartData> _chartData = [];
  List<String> _exceededNames = [];

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

      // Check if any value exceeds 100 and add name to list of exceeded names
      List<String> exceededNames = _chartData.where((item) => item.value > 100).map((item) => item.name).toList();
      setState(() {
        _exceededNames = exceededNames;
      });
    } else {
      throw Exception('Failed to load data');
    }
  }

  // void _showNotifications(BuildContext context,String name) {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => NotificationPage(name:name,messages: _exceededNames),
  //     ),
  //   );
  //   // Clear the list of exceeded names after showing the notifications
  //   setState(() {
  //     _exceededNames.clear();
  //   });
  // }
void _showNotifications(BuildContext context) {
  List<String> notifications = [];
  for (String name in _exceededNames) {
    notifications.add('$name has exceeded 100');
  }
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => NotificationPage(name: 'Notifications', messages: notifications),
    ),
  );
  // Clear the set of exceeded names after showing the notifications
  setState(() {
    _exceededNames.clear();
  });
}



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Graph'),
        actions: [
          if (_exceededNames.isNotEmpty)
            IconButton(
              onPressed: () => _showNotifications(context),
              icon: Icon(Icons.notifications),
            ),
        ],
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