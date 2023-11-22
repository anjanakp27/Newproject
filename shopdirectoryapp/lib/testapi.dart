import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shopdirectoryapp/main.dart';
import 'package:shopdirectoryapp/searchcategory.dart';
import 'dart:convert';
import 'search.dart';
import 'drawer.dart';

class Category {
  final dynamic id;
  final String categoryname;

  Category({
    required this.id,
    required this.categoryname,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
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
  List<Category> categories = [];

  Future<void> _fetchData() async {
    final response =
        await http.get(Uri.parse('http://127.0.0.1:8000/api/fetchcategory'));

    if (response.statusCode == 200) {
      final dynamic responseData = jsonDecode(response.body);
      if (responseData['status'] == 'success') {
        final List<dynamic> categoryData = responseData['data'];
         categoryData.sort((a, b) => a['categoryname'].compareTo(b['categoryname']));

        categories =
            categoryData.map((data) => Category.fromJson(data)).toList();
        setState(() {});
      } else {
        print('API response status is not success');
      }
    } else {
      print('Failed to fetch categories');
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              var valueToPass = categories[index].categoryname;
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => GetCategory(category: valueToPass),
                ),
              );
            },
            child: Center(
              child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                elevation: 10.0,
                color: Colors.cyan[50],
                margin: const EdgeInsets.all(20),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children:<Widget> [
                          ListTile(
              title: Center(child: Text(categories[index].categoryname)),
            ),
                    ],
                  ),
                  // child: Text(
                    
                  //   categories[index].categoryname,
                  //   style: const TextStyle(fontSize: 18),
                    
                  // ),
                ),
              ),
            ),
          );
        },
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: ((context) => SearchCategory(category: ''))));
            },
            child: Icon(Icons.search),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
