

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Employee {
  String id;
  String name;
  String salary;
  String phone;

  Employee({required this.id, required this.name, required this.salary, required this.phone});

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      id: json['id'],
      name: json['name'],
      salary: json['salary'],
      phone: json['phone'],
    );
  }
}

class EmployeePage extends StatefulWidget {
  const EmployeePage({Key? key}) : super(key: key);

  @override
  _EmployeePageState createState() => _EmployeePageState();
}

class _EmployeePageState extends State<EmployeePage> {
  List<Employee> employees = [];
   List<Employee> filteredEmployees = [];

  TextEditingController id = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController salary = TextEditingController();
  TextEditingController phone = TextEditingController();

void _showAddEmployeeDialog() {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Add Employee'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: id,
              decoration: InputDecoration(
                labelText: 'ID',
              ),
            ),
            TextField(
              controller: name,
              decoration: InputDecoration(
                labelText: 'Name',
              ),
            ),
            TextField(
              controller: salary,
              decoration: InputDecoration(
                labelText: 'Salary',
              ),
            ),
            TextField(
              controller: phone,
              decoration: InputDecoration(
                labelText: 'Phone',
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () async {
              var added = await addUser();
              if (added) {
                getEmployees().then((employeeList) {
                  setState(() {
                    employees = employeeList;
                  });
                });
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('User already exists')),
                );
              }
              Navigator.pop(context);
            },
            child: Text('Save'),
          ),
        ],
      );
    },
  );
}


  Future<bool> addUser() async {
    var url = Uri.parse('https://flutter-db.000webhostapp.com/employeeCRUD.php');
    var response = await http.post(url, body: {
      'id': id.text,
      'name': name.text,
      'salary': salary.text,
      'phone': phone.text
    });

    if (response.statusCode == 200) {
      if (response.body == 'User already exists') {
        return false;
      }
      print("Inserted");
      id.text = '';
      name.text = '';
      salary.text = '';
      phone.text = '';
      return true;
    } else {
      throw Exception('Failed to add user');
    }
  }



  Future<List<Employee>> getEmployees() async {
    var url = Uri.parse('https://flutter-db.000webhostapp.com/getEmployee.php');
    var response = await http.get(url);
    List<Employee> employeeList = [];
    if (response.statusCode == 200) {
      var jsonData = json.decode(response.body);
      for (var item in jsonData) {
        Employee employee = Employee.fromJson(item);
        employeeList.add(employee);
      }
    }
    return employeeList;
  }

  @override
  void initState() {
    super.initState();
    getEmployees().then((employeeList) {
      setState(() {
        employees = employeeList;
      });
    });
  }

    void _filterEmployees(String query) {
    filteredEmployees = employees
        .where((employee) =>
            employee.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.grey[900],
        title: TextField(
          // cursorHeight: 10,
        
          decoration: InputDecoration(
    hintText: 'Search Employee',
    prefixIcon: Icon(Icons.search),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide.none,
    ),
    filled: true,
    fillColor: Colors.black,
  
  ),
          style: TextStyle(color: Colors.grey[200]),
          onChanged: (query) => _filterEmployees(query),
        ),
        centerTitle: true,
      ),

 body: ListView.builder(
        itemCount: filteredEmployees.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              leading: Icon(Icons.person),
              title: Text(
                '${filteredEmployees[index].name}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 4),
                  Text(
                    'Salary: ${filteredEmployees[index].salary}',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'Phone: ${filteredEmployees[index].phone}',
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 4),
                ],
              ),
              trailing: IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  // Implement delete functionality here
                },
              ),
            ),
          );
        },
      ),
      
      floatingActionButton: FloatingActionButton(
  onPressed: () {
    _showAddEmployeeDialog();
  },
  child: Icon(Icons.add),
),

    );
  }
}






