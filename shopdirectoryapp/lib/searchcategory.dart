import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shopdirectoryapp/main.dart';

class searchcategory extends StatefulWidget {
  final String category;

  searchcategory({required this.category});

  @override
  _searchcategoryState createState() => _searchcategoryState();
}

class _searchcategoryState extends State<searchcategory> {
  final TextEditingController categoryController = TextEditingController();
  List<Map<String, dynamic>> shopDetails = [];
   

  Future<void> _fetchShopDetails(String category) async {
    try {
      final response = await http.get(
          Uri.parse('http://localhost:8000/api/shops/category/$category'));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);

        setState(() {
          shopDetails =
              List<Map<String, dynamic>>.from(data['data'] ?? []);
        });
      } else {
        // Handle API request errors here, e.g., show an error message
        setState(() {
          shopDetails = [];
        });
      }
    } catch (error) {
      // Handle other errors like network issues
      print("Error: $error");
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
  void initState() {
    super.initState();
    _fetchShopDetails(widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title: Text('Search Category'),
        ),
        drawer: CommonDrawer(),
        body: Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
              controller: categoryController,
              decoration: InputDecoration(labelText: 'Enter category'),
            ),
                SizedBox(height: 16.0),
               ElevatedButton(
              onPressed: () {
                _fetchShopDetails(categoryController.text);
              },
              child: Text('Category Details'),
            ),
            SizedBox(height: 16.0),
          
                if (shopDetails.isNotEmpty)
                
                  Column(
                    
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: shopDetails.map((shopData) {
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
                if (shopDetails.isEmpty)
                  Text('No shop data found'),
              ],
            ),
          ),
        ),
      
    );
  }
}
