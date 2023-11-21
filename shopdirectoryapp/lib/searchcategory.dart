
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'drawer.dart';
import 'package:shopdirectoryapp/main.dart';

class SearchCategory extends StatefulWidget {
  final String category;

  SearchCategory({required this.category});

  @override
  _SearchCategoryState createState() => _SearchCategoryState();
}

class _SearchCategoryState extends State<SearchCategory> {
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

  @override
  void initState() {
    super.initState();
    _fetchShopDetails(widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Category'),
      ),
      drawer: CommonDrawer(),
      body: ListView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        children: [
          Padding(
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
                      return Card(
                        elevation: 5.0,
                        color: Colors.cyan[50],
                        margin: EdgeInsets.all(10.0),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Shop ID: ${shopData['id']}'),
                              Text('Shop Name: ${shopData['shopname']}'),
                              Text('Category: ${shopData['category']}'),
                              Text('Phone Number: ${shopData['phonenumber']}'),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                if (shopDetails.isEmpty) Text('No shop data found'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

