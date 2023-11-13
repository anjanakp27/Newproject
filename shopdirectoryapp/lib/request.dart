import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RequestForm extends StatefulWidget {
  const RequestForm({Key? key}) : super(key: key);

  @override
  State<RequestForm> createState() => RequestFormState();
}

class RequestFormState extends State<RequestForm> {

  
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String shopname= '';
  String category = '';
  String phonenumber = '';



// Future<void> requestSend(newrequest newrequest) async {
//   final apiUrl = "http://localhost:8000/api/addrequest"; // Replace with your API endpoint
//   final jsonData = jsonEncode({
//     "shopname": newrequest.shopName,
//     "category": newrequest.category,
//     "phonenumber": newrequest.phoneNumber,
//   });

//   try {
//     final response = await http.post(
//       Uri.parse(apiUrl),
//       headers: {'Content-Type': 'application/json'},
//       body: jsonData,
//     );

//     if (response.statusCode == 200) {
//       print('Data sent successfully');
//     } else {
//       print("Error: ${response.statusCode}");
//       print("Response: ${response.body}");
//     }
//   } catch (e) {
//     print("Error: $e");
//   }
// }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Request Form"),
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter shop name';
                  }
                  return null;
                },
                onChanged: (value) {
                  shopname
           = value;
                },
                decoration: InputDecoration(
                  labelText: 'Shop Name:',
                ),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter category';
                  }
                  return null;
                },
                onChanged: (value) {
                  category = value;
                },
                decoration: InputDecoration(
                  labelText: 'Category:',
                ),
              ),
              SizedBox(height: 16.0),
              TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter phone number';
                  }
                  return null;
                },
                onChanged: (value) {
                  phonenumber = value;
                },
                decoration: InputDecoration(
                  labelText: 'Phone Number:',
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // requestSend();
                  }
                },
                child: Text('Submit'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
