import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GetSingleEmployee extends StatefulWidget {
  @override
  _GetSingleEmployeeState createState() => _GetSingleEmployeeState();
}

class _GetSingleEmployeeState extends State<GetSingleEmployee> {
  final TextEditingController idController = TextEditingController();
  String shopdetails = '';

  Future<void> _fetchEmployeeDetails(String category) async {
    final response = await http
        .get(Uri.parse('http://127.0.0.1:8000/api/shops/category/$category'));

    if (response.statusCode == 200) {
      final dynamic responseData = jsonDecode(response.body);
      if (responseData['status'] == 'success') {
        final Map<String, dynamic>? shopdata = responseData['data'];
        if (shopdata != null) {
          setState(() {
            shopdetails = '''
            ID: ${shopdata['id']}
            Shopname: ${shopdata['shopname']}
            Category: ${shopdata['category']}
            Phonenumber: ${shopdata['phonenumber']}
            
          ''';
          });
        } else {
          setState(() {
            shopdetails = 'Employee data is null';
          });
        }
      } else {
        setState(() {
          shopdetails = 'Employee not found';
        });
      }
    } else {
      setState(() {
        shopdetails = 'Failed to fetch employee details';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Get Single Employee'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           
         
            SizedBox(height: 16.0),
            Text(shopdetails),
          ],
        ),
      ),
    );
  }
}
