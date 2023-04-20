// import 'dart:ffi';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// import 'login.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.

//   @override
//   Widget build(BuildContext context) {

//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Server',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(title: 'Flutter Server App'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   TextEditingController name = TextEditingController();
//   TextEditingController password = TextEditingController();

//   Future<bool> addUser() async {
//     var url = Uri.parse('https://flutter-db.000webhostapp.com/addUser.php');
//     var response = await http.post(url, body: {
//       'userName': name.text,
//       'userPassword': password.text,
//     });

//     if (response.statusCode == 200) {
//       if (response.body == 'User already exists') {
//         return false;
//       }
//       print("Inserted");
//       name.text = '';
//       password.text = '';
//       return true;
//     } else {
//       throw Exception('Failed to add user');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text(widget.title),
//         centerTitle: true,
//       ),

//       body: Column(children: [
//         Container(
//           margin: EdgeInsets.all(10),
//           child: TextFormField(
//             controller: name,
//             decoration: InputDecoration(
//                 border: OutlineInputBorder(), label: Text('Enter the Name')),
//           ),
//         ),
//         Container(
//           margin: EdgeInsets.all(10),
//           child: TextFormField(
//             controller: password,
//             decoration: InputDecoration(
//                 border: OutlineInputBorder(),
//                 label: Text('Enter the Password')),
//           ),
//         ),
//         Container(
//           margin: EdgeInsets.all(10),
//           child: ElevatedButton(
//             onPressed: () async {
//               var added = await addUser();
//               if (added) {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => LoginPage()),
//                 );
//               } else {
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(content: Text('User already exists')),
//                 );
//               }
//             },
//             child: Text('Sign Up'),
//           ),
//         ),
//         Container(
//   margin: EdgeInsets.all(10),
//   child: ElevatedButton(
//     onPressed: () {
//       Navigator.push(
//         context,
//         MaterialPageRoute(builder: (context) => LoginPage()),
//       );
//     },
//     child: Text('Log In'),
//   ),
// ),
//       ]),
//       // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }

//   Future<void> getData() async {
//     try {
//       final Uri url = Uri.parse('https://flutter-db.000webhostapp.com/get.php');
//       final http.Response response = await http.get(url);
//       final dynamic data = jsonDecode(response.body);
//       print(data);
//     } catch (e) {
//       print('Error occurred: $e');
//     }
//   }

//   @override
//   void initState() {
//     // super.initState();
//     getData();
//   }
// }



// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.

//   @override
//   Widget build(BuildContext context) {

//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Server',
//       theme: ThemeData(
//         colorScheme: ColorScheme.dark(
//           primary: Colors.deepPurple,
//         ),
//         scaffoldBackgroundColor: Colors.black,
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(title: 'Flutter Server App'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});
//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   TextEditingController name = TextEditingController();
//   TextEditingController password = TextEditingController();

  // Future<bool> addUser() async {
  //   var url = Uri.parse('https://flutter-db.000webhostapp.com/addUser.php');
  //   var response = await http.post(url, body: {
  //     'userName': name.text,
  //     'userPassword': password.text,
  //   });

  //   if (response.statusCode == 200) {
  //     if (response.body == 'User already exists') {
  //       return false;
  //     }
  //     print("Inserted");
  //     name.text = '';
  //     password.text = '';
  //     return true;
  //   } else {
  //     throw Exception('Failed to add user');
  //   }
  // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.primary,
//         title: Text(widget.title),
//         centerTitle: true,
//       ),

//       body: Column(children: [
//         Container(
//           margin: EdgeInsets.all(10),
//           child: TextFormField(
//             controller: name,
//             decoration: InputDecoration(
//                 border: OutlineInputBorder(), label: Text('Enter the Name')),
//           ),
//         ),
//         Container(
//           margin: EdgeInsets.all(10),
//           child: TextFormField(
//             controller: password,
//             decoration: InputDecoration(
//                 border: OutlineInputBorder(),
//                 label: Text('Enter the Password')),
//           ),
//         ),
//         Container(
//           margin: EdgeInsets.all(10),
//           child: ElevatedButton(
//             onPressed: () async {
//               var added = await addUser();
//               if (added) {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => LoginPage()),
//                 );
//               } else {
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(content: Text('User already exists')),
//                 );
//               }
//             },
//             child: Text('Sign Up'),
//           ),
//         ),
//         Container(
//           margin: EdgeInsets.all(10),
//           child: ElevatedButton(
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => LoginPage()),
//               );
//             },
//             child: Text('Log In'),
//           ),
//         ),
//       ]),
//       // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
// import 'dart:ffi';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// import 'login.dart';

// void main() {
//   runApp(const MyApp());
// }
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.

//   @override
//   Widget build(BuildContext context) {

//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Server',
//       theme: ThemeData(
//         colorScheme: ColorScheme.dark(
//           primary: Colors.deepPurple,
//         ),
//         scaffoldBackgroundColor: Colors.black,
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(title: 'Flutter Server App'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);
//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   TextEditingController name = TextEditingController();
//   TextEditingController password = TextEditingController();

//   Future<bool> addUser() async {
//     var url = Uri.parse('https://flutter-db.000webhostapp.com/addUser.php');
//     var response = await http.post(url, body: {
//       'userName': name.text,
//       'userPassword': password.text,
//     });

//     if (response.statusCode == 200) {
//       if (response.body == 'User already exists') {
//         return false;
//       }
//       print("Inserted");
//       name.text = '';
//       password.text = '';
//       return true;
//     } else {
//       throw Exception('Failed to add user');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.primary,
//         title: Text(widget.title),
//         centerTitle: true,
//       ),
//       body: Stack(
//         children: [
//           Container(
//             decoration: BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage('assets/background.jpg'),
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           Positioned.fill(
//             child: Container(
//               margin: EdgeInsets.all(20),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Container(
//                     margin: EdgeInsets.all(10),
//                     child: TextFormField(
//                       controller: name,
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(),
//                         labelText: 'Enter the Name',
//                         labelStyle: TextStyle(color: Colors.white),
//                       ),
//                     ),
//                   ),
//                   Container(
//                     margin: EdgeInsets.all(10),
//                     child: TextFormField(
//                       controller: password,
//                       decoration: InputDecoration(
//                         border: OutlineInputBorder(),
//                         labelText: 'Enter the Password',
//                         labelStyle: TextStyle(color: Colors.white),
//                       ),
//                     ),
//                   ),
//                   Container(
//                     margin: EdgeInsets.all(10),
//                     child: ElevatedButton(
//                       onPressed: () async {
//                         var added = await addUser();
//                         if (added) {
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => LoginPage(),
//                             ),
//                           );
//                         } else {
//                           ScaffoldMessenger.of(context).showSnackBar(
//                             SnackBar(
//                               content: Text('User already exists'),
//                             ),
//                           );
//                         }
//                       },
//                       child: Text('Sign Up'),
//                     ),
//                   ),
//                   Container(
//                     margin: EdgeInsets.all(10),
//                     child: ElevatedButton(
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (context) => LoginPage(),
//                           ),
//                         );
//                       },
//                       child: Text('Log In'),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

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
        colorScheme: ColorScheme.dark(
          primary: Colors.deepPurple,
        ),
        scaffoldBackgroundColor: Colors.black,
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
      // appBar: AppBar(
      //   backgroundColor: Theme.of(context).colorScheme.primary,
      //   title: Text(widget.title),
      //   centerTitle: true,
      // ),

//       body: Stack(
//         children: [
          // Image.asset(
          //   'assets/background.jpg',
          //   fit: BoxFit.cover,
          //   width: double.infinity,
          //   height: double.infinity,
          // ),
//           Center(
//         child:  Container(
//             margin: EdgeInsets.all(20),
//             padding: EdgeInsets.all(20),
//             decoration: BoxDecoration(
//               color: Colors.black,
//               borderRadius: BorderRadius.circular(20),
//             ),
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               children: [
              
//                 Container(
                  
//                   margin: EdgeInsets.all(10),
                
//                   child: TextFormField(
//                     controller: name,
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(),
//                       labelText: 'Enter your name',
//                     ),
//                   ),
//                 ),
//                 Container(
//                   margin: EdgeInsets.all(10),
//                   child: TextFormField(
//                     controller: password,
//                     obscureText: true,
//                     decoration: InputDecoration(
//                       border: OutlineInputBorder(),
//                       labelText: 'Enter your password',
//                     ),
//                   ),
//                 ),
                
//                 Container(
                  
//                   margin: EdgeInsets.all(10),
//                   child: ElevatedButton(
//                      style: ElevatedButton.styleFrom(
//                                   primary: Color.fromARGB(255, 28, 148, 246)),
//                     onPressed: () async {
//                       var added = await addUser();
//                       if (added) {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(builder: (context) => LoginPage()),
//                         );
//                       } else {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(content: Text('User already exists')),
//                         );
//                       }
//                     },
//                     child: Text('Sign Up',style:TextStyle(color: Colors.white),),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           ),
//         ],
//       ),

// bottomSheet: Container(
//         width: double.infinity,
//         height: 80,
//         color: Colors.black,
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               "Already have an account? ",
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 16,
//               ),
//             ),
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(builder: (context) => LoginPage()),
//                 );
//               },
//               child: Text('Log In'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


body: Stack(
        children: [
            Image.asset(
            'assets/background.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          // Centered container with input fields and sign up button
          Align(
            alignment: Alignment.center,
            child: Container(
              margin: EdgeInsets.all(20),
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    child: TextFormField(
                      controller: name,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        labelText: 'Enter your name',
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: TextFormField(
                      controller: password,
                      obscureText: true,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        
                        labelText: 'Enter your password',
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    height: 40,
                    width: 250,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromARGB(255, 28, 148, 246),
                      ),
                      onPressed: () async {
                        var added = await addUser();
                        if (added) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('User already exists'),
                            ),
                          );
                        }
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Bottom sheet with "Already have an account? Log In" message
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account? ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginPage(),
                          ),
                        );
                      },
                      child: Text(
                        'Log In',
                        style: TextStyle(
                          color: Colors.blueAccent,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}