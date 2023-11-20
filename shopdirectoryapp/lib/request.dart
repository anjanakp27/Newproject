
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shopdirectoryapp/main.dart';




class RequestForm extends StatefulWidget {
  const RequestForm({Key? key}) : super(key: key);

  @override
  State<RequestForm> createState() => RequestFormState();
}

class RequestFormState extends State<RequestForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController shopnameController=TextEditingController();
  final TextEditingController categoryController=TextEditingController();
  final TextEditingController phonenumberController=TextEditingController();

 
 Future<void> _createUser() async {
    final response = await http.post(
      Uri.parse('http://localhost:8000/api/addrequest'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'shopname': shopnameController.text,
        'category': categoryController.text,
        'phonenumber': phonenumberController.text,
      }),
    );

  if (response.statusCode == 201) 
  {
      if (kDebugMode) {
        print('Request created successfully');
      }
      // ignore: use_build_context_synchronously
      Navigator.pop(context); // Navigate back to previous screen
    } 
    else 
    {
      if (kDebugMode) {
        print(response.body);
      }

    }
  }
       


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Request Form"),
      ),
      drawer: CommonDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: shopnameController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter shop name';
                  }
                  return null;
                },
             
                decoration: const InputDecoration(
                  labelText: 'Shop Name:',
                ),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: categoryController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter category';
                  }
                  return null;
                },
              
                decoration: const InputDecoration(
                  labelText: 'Category:',
                ),
              ),
              const SizedBox(height: 16.0),
              TextFormField(
                controller: phonenumberController,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter phone number';
                  }
                  return null;
                },
             
                decoration: const InputDecoration(
                  labelText: 'Phone Number:',
                ),
              ),
              const SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: (){

                        _createUser();
                }, child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}



