import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Getcategory extends StatefulWidget {
  final String category;

  Getcategory({required this.category});

  @override
  _GetcategoryState createState() => _GetcategoryState();
}

class _GetcategoryState extends State<Getcategory> {
  final TextEditingController categoryController = TextEditingController();
  List<Map<String, dynamic>> shopdetails = [];

  Future<void> _fetchShopDetails(String category) async {
    final response =
        await http.get(Uri.parse('http://localhost:8000/api/shops/category/$category'));

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
  void initState() {
    super.initState();
    _fetchShopDetails(widget.category);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(centerTitle:true,
          title: Text('Get Shop Details'),
        ),
        body: Center(
          child: Column(
            children: [
              
              // Center(
              //   child: Text('Passed Value: ${widget.category}'),
              // ),
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
                Center(
                  child: Text('No shop data found'),
                ),
            ],
          ),
        ),
      );
    
  }
}
