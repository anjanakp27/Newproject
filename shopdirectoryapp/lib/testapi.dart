import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'search.dart';
import 'package:shopdirectoryapp/search.dart';




class Employee {
  final dynamic id;
  final String categoryname;
  

  Employee({
    required this.id,
    required this.categoryname,
    
  });

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      id: json['id'],
      categoryname: json['categoryname'],
      
    );
  }
}


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Employee> employees = [];
  

  Future<void> _fetchEmployees() async {
    final response = await http
        .get(Uri.parse('http://127.0.0.1:8000/api/fetchcategory'));

    if (response.statusCode == 200) {
      final dynamic responseData = jsonDecode(response.body);
      if (responseData['status'] == 'success') {
        final List<dynamic> employeeData = responseData['data'];
        employees =
            employeeData.map((data) => Employee.fromJson(data)).toList();
        setState(() {});
      } else {
        print('API response status is not success');
      }
    } else {
      print('Failed to fetch employees');
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchEmployees();
  }
@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      centerTitle: true,
      title: Text('SHOP DIRECTORY APP'),
    ),
    body: ListView.builder(
      itemCount: employees.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            var valueToPass = employees[index].categoryname;
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => GetSingleEmployee1(category: valueToPass),
              ),
            );
          },
          child: ListTile(
            title: Text(employees[index].categoryname),
          ),
        );
      },
    ),
    floatingActionButton: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/add');
          },
          child: Icon(Icons.add),
        ),
        SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/getSingleEmployee');
          },
          child: Icon(Icons.search),
          // You can also use Tooltip here if needed
        ),
        SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/update');
          },
          child: Icon(Icons.edit),
          // You can also use Tooltip here if needed
        ),
        SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/delete');
          },
          child: Icon(Icons.delete),
          // You can also use Tooltip here if needed
        ),
      ],
    ),
  );
}
}