import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shopdirectoryapp/main.dart';
import 'package:shopdirectoryapp/searchcategory.dart';
import 'dart:convert';
import 'search.dart';
import 'drawer.dart';
import 'dart:math';
import 'backgroundimage.dart';

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
  final Random random = Random();
   final List<Color> distinctColors = [
    Colors.pink.shade800,
    Colors.red.shade800,
    Colors.green.shade900,
    Colors.brown.shade400,
    Colors.purple.shade700,
  ];

  // Function to generate a random color
  // Color getRandomColor() {
    
  //   return distinctColors[random.nextInt(distinctColors.length)];
  // }
   List<Color> usedColors = [];

   // Function to generate a random color that has not been used before
  Color getRandomColor() {
    List<Color> availableColors = List.from(distinctColors.where((color) => !usedColors.contains(color)));

    if (availableColors.isEmpty) {
      // If all colors have been used, reset the usedColors list
      usedColors.clear();
      availableColors = List.from(distinctColors);
    }

    Color randomColor = availableColors[random.nextInt(availableColors.length)];
    usedColors.add(randomColor);

    return randomColor;
  }

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
    return BackgroundImage
    (child:Scaffold(
      
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (context, index) {
           // Generate a random color for each card
          Color randomColor = getRandomColor();
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
                color: randomColor, // Set the random color here
                margin: const EdgeInsets.all(20),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children:<Widget> [
                          ListTile(
              // title: Center(child: Text(categories[index].categoryname)),
              title: Center(
  child: Text(
    categories[index].categoryname,
    style: TextStyle(color: Colors.white),
  ),
),
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
    )
    );
  }
}
