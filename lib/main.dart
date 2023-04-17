import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Server',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Server App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController name = TextEditingController();
  TextEditingController password = TextEditingController();

  Future<bool> addUser() async {
    var url = Uri.parse('https://flutter-db.000webhostapp.com/addUser.php');
    var response = await http.post(url, body: {
      'userName': name.text,
      'userPassword': password.text,
    });

    if (response.statusCode == 200) {
      if (response.body == 'User already exists') {
        return false;
      }
      print("Inserted");
      name.text = '';
      password.text = '';
      return true;
    } else {
      throw Exception('Failed to add user');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true,
      ),

      body: Column(children: [
        Container(
          margin: EdgeInsets.all(10),
          child: TextFormField(
            controller: name,
            decoration: InputDecoration(
                border: OutlineInputBorder(), label: Text('Enter the Name')),
          ),
        ),
        Container(
          margin: EdgeInsets.all(10),
          child: TextFormField(
            controller: password,
            decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text('Enter the Password')),
          ),
        ),
        Container(
          margin: EdgeInsets.all(10),
          child: ElevatedButton(
            onPressed: () async {
              var added = await addUser();
              if (added) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('User already exists')),
                );
              }
            },
            child: Text('Sign Up'),
          ),
        ),
        Container(
  margin: EdgeInsets.all(10),
  child: ElevatedButton(
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    },
    child: Text('Log In'),
  ),
),
      ]),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Future<void> getData() async {
    try {
      final Uri url = Uri.parse('https://flutter-db.000webhostapp.com/get.php');
      final http.Response response = await http.get(url);
      final dynamic data = jsonDecode(response.body);
      print(data);
    } catch (e) {
      print('Error occurred: $e');
    }
  }

  @override
  void initState() {
    // super.initState();
    getData();
  }
}
