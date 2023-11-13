import 'dart:html';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


class MyForm extends StatefulWidget {
  @override
  _MyFormState createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  Future<void> sendDataToApi(newrequest newrequest) async {
  final apiUrl = "http://localhost:8000/api/addrequest"; // Replace with your API endpoint
  final jsonData = jsonEncode({
    "shopname": newrequest.shopName,
    "category": newrequest.category,
    "phonenumber": newrequest.phoneNumber,
  });

  try {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonData,
    );

    if (response.statusCode == 200) {
      print('Data sent successfully');
    } else {
      print("Error: ${response.statusCode}");
      print("Response: ${response.body}");
    }
  } catch (e) {
    print("Error: $e");
  }
}
  final _formKey = GlobalKey<FormState>();
  final _newrequest = newrequest(shopName: '', category: '', phoneNumber: '');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Form')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Shop Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a shop name';
                  }
                  return null;
                },
                onSaved: (value) {
                  _newrequest.shopName = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Category'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a category';
                  }
                  return null;
                },
                onSaved: (value) {
                  _newrequest.category = value!;
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Phone Number'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a phone number';
                  }
                  return null;
                },
                onSaved: (value) {
                  _newrequest.phoneNumber = value!;
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    sendDataToApi(_newrequest);
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
