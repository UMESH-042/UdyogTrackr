import 'package:flutter/material.dart';
import 'package:flutter_dbms2/dashboard.dart';
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

  Future<void> _login() async {
    final url = 'https://flutter-db.000webhostapp.com/login.php';
    final response = await http.post(
      Uri.parse(url),
      body: {
        'userName': _userNameController.text,
        'userPassword': _userPasswordController.text,
      },
    );

    if (response.statusCode == 200) {
      if (response.body == 'Login successful') {
        // Navigate to home page
        print('Login Successful');

        Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>HomePage()),
      );
        
      } 
      else {
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
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _login();
                  }
      //              Navigator.pushReplacement(
      //   context,
      //   MaterialPageRoute(builder: (context) =>HomePage()),
      // );

                },
                child: Text('Login'),
              ),
              if (_errorMessage.isNotEmpty)
                Text(
                  _errorMessage,
                  style: TextStyle(
                    color: Colors.red,
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}


