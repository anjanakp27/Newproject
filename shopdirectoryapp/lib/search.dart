
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'drawer.dart';
import 'package:shopdirectoryapp/main.dart';

class GetCategory extends StatefulWidget {
  final String category;

  GetCategory({required this.category});

  @override
  _GetCategoryState createState() => _GetCategoryState();
}

class _GetCategoryState extends State<GetCategory> {
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
        title: Text('Get Shop Details'),
      ),
      drawer: CommonDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ListTile(
                  title: Text(
                    'Category: ${widget.category}',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
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
                            Text('Shop Name: ${shopData['shopname']}'),
                            Text('Phone Number: ${shopData['phonenumber']}'),
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              if (shopDetails.isEmpty)
                Text('No data found'),
            ],
          ),
        ),
      ),
    );
  }
}

