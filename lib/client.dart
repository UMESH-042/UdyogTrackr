// import 'package:flutter/material.dart';
// import 'package:flutter_dbms2/dashboard.dart';
// import 'package:flutter_dbms2/home.dart';
// import 'package:http/http.dart' as http;

// class client extends StatefulWidget {
//   const client({super.key});

//   @override
//   State<client> createState() => _clientState();
// }

// class _clientState extends State<client> {
//   TextEditingController name = TextEditingController();
//   TextEditingController email = TextEditingController();
//   TextEditingController phone = TextEditingController();
//   Future<bool> addUser() async {
//     var url = Uri.parse('https://flutter-db.000webhostapp.com/ClientsCRUD.php');
//     var response = await http.post(url,
//         body: {'name': name.text, 'email': email.text, 'phone': phone.text});

//     if (response.statusCode == 200) {
//       if (response.body == 'User already exists') {
//         return false;
//       }
//       print("Inserted");
//       name.text = '';
//       email.text = '';
//       phone.text = '';
//       return true;
//     } else {
//       throw Exception('Failed to add user');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.grey[900],
//         title: Text('Clients',style: TextStyle(color: Colors.white)),
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
//             controller: email,
//             decoration: InputDecoration(
//                 border: OutlineInputBorder(),
//                 label: Text('Enter the Email')),
//           ),
//         ),
//         Container(
//           margin: EdgeInsets.all(10),
//           child: TextFormField(
//             controller: phone,
//             decoration: InputDecoration(
//                 border: OutlineInputBorder(),
//                 label: Text('Enter the Phone Number')),
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
//                   MaterialPageRoute(builder: (context) => HomePage()),
//                 );
//               } else {
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(content: Text('User already exists')),
//                 );
//               }
//             },
//             child: Text('Save'),
//           ),
//         ),
//       ]),
//       // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:flutter_dbms2/dashboard.dart';
// import 'package:flutter_dbms2/home.dart';
// import 'package:http/http.dart' as http;

// class client extends StatefulWidget {
//   const client({super.key});

//   @override
//   State<client> createState() => _clientState();
// }

// class _clientState extends State<client> {
//   TextEditingController username = TextEditingController();
//   TextEditingController contact = TextEditingController();
//   TextEditingController date = TextEditingController();
//   TextEditingController price = TextEditingController();
//   TextEditingController name = TextEditingController();
//   TextEditingController value = TextEditingController();

//   Future<bool> addUser() async {
//     var url = Uri.parse('https://flutter-db.000webhostapp.com/ClientsCRUD.php');
//     var response = await http.post(url, body: {
//       'username': username.text,
//       'contact': contact.text,
//       'date': date.text,
//       'price': price.text,
//       'name': name.text,
//       'value': value.text
//     });

//     if (response.statusCode == 200) {
//       if (response.body == 'User already exists') {
//         return false;
//       }
//       print("Inserted");
//       username.text = '';
//       contact.text = '';
//       date.text = '';
//       price.text = '';
//       name.text = '';
//       value.text = '';
//       return true;
//     } else {
//       throw Exception('Failed to add user');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.grey[900],
//         title: Text('Clients', style: TextStyle(color: Colors.white)),
//         centerTitle: true,
//       ),

//       body: Column(children: [
//         Container(
//           margin: EdgeInsets.all(10),
//           child: TextFormField(
//             controller: username,
//             decoration: InputDecoration(
//                 border: OutlineInputBorder(), label: Text('Enter the Name')),
//           ),
//         ),
//         Container(
//           margin: EdgeInsets.all(10),
//           child: TextFormField(
//             controller: contact,
//             decoration: InputDecoration(
//                 border: OutlineInputBorder(), label: Text('Enter the Contact No.')),
//           ),
//         ),
//         Container(
//           margin: EdgeInsets.all(10),
//           child: TextFormField(
//             controller: date,
//             decoration: InputDecoration(
//                 border: OutlineInputBorder(),
//                 label: Text('Enter the Date')),
//           ),
//         ),

//   Container(
//           margin: EdgeInsets.all(10),
//           child: TextFormField(
//             controller: price,
//             decoration: InputDecoration(
//                 border: OutlineInputBorder(),
//                 label: Text('Enter the Price')),
//           ),
//         ),

//         Container(
//           margin: EdgeInsets.all(10),
//           child: TextFormField(
//             controller: name,
//             decoration: InputDecoration(
//                 border: OutlineInputBorder(),
//                 label: Text('Enter the Material ')),
//           ),
//         ),
//         Container(
//           margin: EdgeInsets.all(10),
//           child: TextFormField(
//             controller: value,
//             decoration: InputDecoration(
//                 border: OutlineInputBorder(),
//                 label: Text('Enter the Quantity')),
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
//                   MaterialPageRoute(builder: (context) => HomePage()),
//                 );
//               } else {
//                 ScaffoldMessenger.of(context).showSnackBar(
//                   SnackBar(content: Text('User already exists')),
//                 );
//               }
//             },
//             child: Text('Save'),
//           ),
//         ),
//       ]),
//       // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class client extends StatefulWidget {
  @override
  _clientState createState() => _clientState();
}

class _clientState extends State<client> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _valueController = TextEditingController();

  Future<void> _submitForm() async {
    final url =
        Uri.parse('https://flutter-db.000webhostapp.com/ClientsCRUD.php');
    final response = await http.post(url, body: {
      'username': _usernameController.text,
      'contact': _contactController.text,
      'date': _dateController.text,
      'price': _priceController.text,
      'name': _nameController.text,
      'value': _valueController.text,
    });

    if (response.statusCode == 200) {
      // handle successful response
      print(response.body);
      _usernameController.text = '';
      _contactController.text = '';
      _dateController.text = '';
      _priceController.text = '';
      _nameController.text = '';
      _valueController.text = '';
    } else {
      // handle error
      print('Error adding user: ${response.reasonPhrase}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Client Details',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.grey[900],
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _usernameController,
                decoration: InputDecoration(labelText: 'Username'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a username';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _contactController,
                decoration: InputDecoration(labelText: 'Contact'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a contact';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _dateController,
                decoration: InputDecoration(labelText: 'Date'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a date';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _priceController,
                decoration: InputDecoration(labelText: 'Price'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a price';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _valueController,
                decoration: InputDecoration(labelText: 'Value'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a value';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _submitForm();
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
