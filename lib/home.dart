
// // import 'package:flutter/material.dart';
// // import 'package:flutter_dbms2/billing.dart';
// // import 'package:flutter_dbms2/client.dart';
// // import 'package:flutter_dbms2/employee.dart';

// // import 'dashboard.dart';


// // void main() {
// //   runApp(MyApp());
// // }

// // class MyApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       title: 'Bottom Navigation Bar Demo',
// //       theme: ThemeData(
// //         primarySwatch: Colors.blue,
// //       ),
// //       home: HomePage(),
// //     );
// //   }
// // }

// // class HomePage extends StatefulWidget {
// //   @override
// //   _HomePageState createState() => _HomePageState();
// // }

// // class _HomePageState extends State<HomePage> {
// //   int _selectedIndex = 0; 
// //   final List<Widget> _pages = [
// //     dashboard(),
// //     employee(),
// //     client(),
// //     billing(),
// //   ];

// //   void _onItemTapped(int index) {
// //     setState(() {
// //       _selectedIndex = index;
// //     });
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: _pages[_selectedIndex],
// //       bottomNavigationBar: BottomNavigationBar(
// //         backgroundColor: Colors.black,
// //         items: [
// //           BottomNavigationBarItem(
// //             icon: Icon(Icons.home),
// //             label: 'Home',
// //           ),
// //           BottomNavigationBarItem(
// //             icon: Icon(Icons.search),
// //             label: 'Employees',
// //           ),
// //           BottomNavigationBarItem(
// //             icon: Icon(Icons.person),
// //             label: 'Clients',
// //           ),
// //           BottomNavigationBarItem(
// //             icon: Icon(Icons.business),
// //             label: 'Billing',
// //           ),
// //         ],
// //         currentIndex: _selectedIndex,
// //         onTap: _onItemTapped,
// //       ),
// //     );
// //   }
// // }



import 'package:flutter/material.dart';
import 'package:flutter_dbms2/billing.dart';
import 'package:flutter_dbms2/client.dart';
import 'package:flutter_dbms2/employee.dart';
import 'package:http/http.dart';

import 'dashboard.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0; 
  final List<Widget> _pages = [    dashboard(),    EmployeePage(),    client(),    MyGraph(),  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        
    type: BottomNavigationBarType.fixed, // Fixed 
  backgroundColor: Colors.black, // <-- This works for fixed
  selectedItemColor: Colors.greenAccent,
  unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Employees',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Clients',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'Graph',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
