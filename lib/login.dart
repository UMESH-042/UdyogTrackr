// import 'package:flutter/material.dart';
// import 'package:flutter_dbms2/dashboard.dart';
// import 'package:http/http.dart' as http;

// import 'home.dart';

// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final _formKey = GlobalKey<FormState>();
//   final _userNameController = TextEditingController();
//   final _userPasswordController = TextEditingController();

//   String _errorMessage = '';

//   Future<void> _login() async {
//     final url = 'https://flutter-db.000webhostapp.com/login.php';
//     final response = await http.post(
//       Uri.parse(url),
//       body: {
//         'userName': _userNameController.text,
//         'userPassword': _userPasswordController.text,
//       },
//     );

//     if (response.statusCode == 200) {
//       if (response.body == 'Login successful') {
//         // Navigate to home page
//         print('Login Successful');

//         Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) =>HomePage()),
//       );

//       }
//       else {
//         setState(() {
//           _errorMessage = 'Invalid username or password';
//         });
//       }
//     } else {
//       setState(() {
//         _errorMessage = 'Error occurred while logging in';
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Login'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               TextFormField(
//                 controller: _userNameController,
//                 decoration: InputDecoration(
//                   labelText: 'Username',
//                 ),
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your username';
//                   }
//                   return null;
//                 },
//               ),
//               TextFormField(
//                 controller: _userPasswordController,
//                 decoration: InputDecoration(
//                   labelText: 'Password',
//                 ),
//                 obscureText: true,
//                 validator: (value) {
//                   if (value == null || value.isEmpty) {
//                     return 'Please enter your password';
//                   }
//                   return null;
//                 },
//               ),
//               ElevatedButton(
//                 onPressed: () {
//                   if (_formKey.currentState!.validate()) {
//                     _login();
//                   }
//       //              Navigator.pushReplacement(
//       //   context,
//       //   MaterialPageRoute(builder: (context) =>HomePage()),
//       // );

//                 },
//                 child: Text('Login'),
//               ),
//             if (_errorMessage.isNotEmpty)
//               Text(
//                 _errorMessage,
//                 style: TextStyle(
//                   color: Colors.red,
//                 ),
//               ),
//           ],
//         ),
//       ),
//     ),
//   );
// }
// }

import 'package:flutter/material.dart';
import 'package:flutter_dbms2/dashboard.dart';
import 'package:flutter_dbms2/main.dart';
import 'package:http/http.dart' as http;

import 'home.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _userNameController = TextEditingController();
  final _userPasswordController = TextEditingController();

  String _errorMessage = '';
  bool _isLoading = false;

  Future<void> _login() async {
    final url = 'https://flutter-db.000webhostapp.com/login.php';
    setState(() {
      _isLoading = true;
    });
    final response = await http.post(
      Uri.parse(url),
      body: {
        'userName': _userNameController.text,
        'userPassword': _userPasswordController.text,
      },
    );
    setState(() {
      _isLoading = false;
    });

    if (response.statusCode == 200) {
      if (response.body == 'Login successful') {
        // Navigate to home page
        print('Login Successful');

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomePage()),
        );
      } else {
        setState(() {
          _errorMessage = 'Invalid username or password';
        });
      }
    } else {
      setState(() {
        _errorMessage = 'Error occurred while logging in';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Colors.blue[300],
      //   toolbarHeight: 100,
      //   elevation: 14,
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.only(bottomRight: Radius.circular(70),bottomLeft: Radius.circular(70))
      //   ),
      //   title: Text('Lets Login'),
      // ),
      // appBar: AppBar(
      //   backgroundColor: Colors.blue[700],
      //   title: Text('Login'),
      // ),
      body: Stack(
        children: [
          Image.asset(
            'assets/background.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Center(
          
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Hero(
                  tag: 'login',
                  child: AnimatedContainer(
                    duration: Duration(seconds: 1),
                    curve: Curves.fastLinearToSlowEaseIn,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    padding: EdgeInsets.all(16.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextFormField(
                            controller: _userNameController,
                            decoration: InputDecoration(
                              labelText: 'Username',
                             
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your username';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 16.0,
                          ),
                          TextFormField(
                            controller: _userPasswordController,
                            decoration: InputDecoration(
                              labelText: 'Password',
                            ),
                            obscureText: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter your password';
                              }
                              return null;
                            },
                          ),
                          SizedBox(
                            height: 32.0,
                          ),
                          new SizedBox(
                            width: 300,
                            height: 50,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Color.fromARGB(255, 28, 148, 246)),
                              onPressed: _isLoading
                                  ? null
                                  : () {
                                      if (_formKey.currentState!.validate()) {
                                        _login();
                                      }
                                    },
                              child: _isLoading
                                  ? SizedBox(
                                      height: 20.0,
                                      width: 20.0,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                                Colors.white),
                                      ),
                                    )
                                  : Text(
                                      'Login',
                                      style: TextStyle(color: Colors.white),
                                    ),
                            ),
                          ),
                          SizedBox(
                            height: 16.0,
                          ),
                          Text(
                            _errorMessage,
                            style: TextStyle(
                              color: Colors.red,
                            ),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text('Don\'t have an account? ',style: TextStyle(color: Colors.white),),
                          TextButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MyApp(),
                                ),
                              );
                            },
                            child: Text('Sign up',
                                style: TextStyle(color: Colors.blue)),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
