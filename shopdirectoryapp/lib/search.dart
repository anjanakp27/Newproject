import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class GetSingleEmployee extends StatefulWidget {
  @override
  _GetSingleEmployeeState createState() => _GetSingleEmployeeState();
}

class _GetSingleEmployeeState extends State<GetSingleEmployee> {
  final TextEditingController categoryController = TextEditingController();
  List<Map<String, dynamic>> shopdetails = [];

  Future<void> _fetchShopDetails(String category) async {
    final response = await http.get(Uri.parse('http://localhost:8000/api/shops/category/$category'));

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);

      setState(() {
        shopdetails = List<Map<String, dynamic>>.from(data['data']);
      });
    } else {
      // Handle API request errors here, e.g., show an error message
      setState(() {
        shopdetails = [];
      });
    }
  }

  void _showValueInDialog(String value) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Entered Value'),
          content: Text(value),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Get Shop Details'),
        ),
        body: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: categoryController,
                decoration: InputDecoration(labelText: 'Enter Category'),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  _fetchShopDetails(categoryController.text);
                },
                child: Text('Show Shop Details'),
              ),
              SizedBox(height: 16.0),
              if (shopdetails.isNotEmpty)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: shopdetails.map((shopData) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Shop ID: ${shopData['id']}'),
                        Text('Shop Name: ${shopData['shopname']}'),
                        Text('Category: ${shopData['category']}'),
                        Text('Phone Number: ${shopData['phonenumber']}'),
                      ],
                    );
                  }).toList(),
                ),
              if (shopdetails.isEmpty)
                Text('No shop data found'),
            ],
          ),
        ),
      ),
    );
  }
}
