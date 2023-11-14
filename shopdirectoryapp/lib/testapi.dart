import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'search.dart';
import 'package:shopdirectoryapp/search.dart';




class category {
  final dynamic id;
  final String categoryname;
  

  category({
    required this.id,
    required this.categoryname,
    
  });

  factory category.fromJson(Map<String, dynamic> json) {
    return category(
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
  List<category> categorys = [];
  

  Future<void> _fetchdata() async {
    final response = await http
        .get(Uri.parse('http://127.0.0.1:8000/api/fetchcategory'));

    if (response.statusCode == 200) {
      final dynamic responseData = jsonDecode(response.body);
      if (responseData['status'] == 'success') {
        final List<dynamic> categoryData = responseData['data'];
        categorys =
            categoryData.map((data) => category.fromJson(data)).toList();
        setState(() {});
      } else {
        print('API response status is not success');
      }
    } else {
      print('Failed to fetch categorys');
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchdata();
  }
@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      centerTitle: true,
      title: Text('SHOP DIRECTORY APP'),
    ),
    body: ListView.builder(
      itemCount: categorys.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            
            var valueToPass = categorys[index].categoryname;
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Getcategory(category: valueToPass),
              ),
            );
          },
          child: ListTile(
            title: Text(categorys[index].categoryname),
          ),
        );
      },
    ),
    floatingActionButton: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/add');
          },
          child: Icon(Icons.add),
        ),
        SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/getSinglecategory');
          },
          child: Icon(Icons.search),
          // You can also use Tooltip here if needed
        ),
        SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/update');
          },
          child: Icon(Icons.edit),
          // You can also use Tooltip here if needed
        ),
        SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/delete');
          },
          child: Icon(Icons.delete),
          // You can also use Tooltip here if needed
        ),
      ],
    ),
  );
}
}