
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:shopdirectoryapp/appbar.dart';
// import 'dart:convert';
// import 'drawer.dart';
// import 'package:shopdirectoryapp/main.dart';
// import 'package:url_launcher/url_launcher.dart';

// class SearchCategory extends StatefulWidget {
//   final String category;

//   SearchCategory({required this.category});

//   @override
//   _SearchCategoryState createState() => _SearchCategoryState();
// }

// class _SearchCategoryState extends State<SearchCategory> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
//   final TextEditingController categoryController = TextEditingController();
//   List<Map<String, dynamic>> shopDetails = [];

//   Future<void> _fetchShopDetails(String category) async {
//     try {
//       final response = await http.get(
//           Uri.parse('http://localhost:8000/api/shops/category/$category'));

//       if (response.statusCode == 200) {
//         final Map<String, dynamic> data = json.decode(response.body);
//          List<Map<String, dynamic>> sortedShopDetails =
//           List<Map<String, dynamic>>.from(data['data'] ?? []);

//       // Sort shop details alphabetically based on shop name
//       sortedShopDetails.sort((a, b) =>
//           a['shopname'].toString().compareTo(b['shopname'].toString()));
// setState(() {
//         shopDetails = sortedShopDetails;
//       });

//       } else {
//         // Handle API request errors here, e.g., show an error message
//         setState(() {
//           shopDetails = [];
//         });
//       }
//     } catch (error) {
//       // Handle other errors like network issues
//       print("Error: $error");
//     }
//   }

 
 
//  _launchDialer(dynamic phoneNumber) async {
//   final url = 'tel:${phoneNumber.toString()}';
//   if (await canLaunch(url)) {
//     await launch(url);
//   } else {
//     // Handle error
//     print('Could not launch $url');
//   }
// }


//   @override
//   void initState() {
//     super.initState();
//     _fetchShopDetails(widget.category);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: CommonAppBar(
//         title:'Search Category'),
      
//       drawer: CommonDrawer(),
//       body: ListView(
//         keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
//         children: [
//           Padding(
//             padding: EdgeInsets.all(16.0),
//             key: _formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 TextFormField(
//                   controller: categoryController,
//                   decoration: InputDecoration(labelText: 'Enter category'),
//                   validator: (value) {
//     if (value == null || value.isEmpty) {
//       return 'Please enter a category';
//     }
//     // You can add additional validation logic if needed
//     return null; // Return null if the input is valid
//   },
//                 ),
//                 SizedBox(height: 16.0),
//                 ElevatedButton(
//                   onPressed: () 
//                   {
//                     if (_formKey.currentState!.validate())
//                    {
//                     _fetchShopDetails(categoryController.text);
//                    }
//                   },
//                   child: Text('Category Details'),
//                 ),
//                 SizedBox(height: 16.0),
//                 if (shopDetails.isNotEmpty)
//                   Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: shopDetails.map((shopData) {
//                       return Card(
//                         elevation: 5.0,
//                         color: Colors.cyan[50],
//                         margin: EdgeInsets.all(10.0),
//                         child: Padding(
//                           padding: const EdgeInsets.all(16.0),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                                Row(
//                                 children: [
//                                   Icon(Icons.shop), // Add shop icon
//                                   SizedBox(width: 8.0),
//                                   Text('Shop Name: ${shopData['shopname']}'),
//                                 ],
//                               ),
//                               Row(
//                                 children: [
//                                   Icon(Icons.category), // Add category icon
//                                   SizedBox(width: 8.0),
//                                   Text('Category: ${shopData['category']}'),
//                                 ],
//                               ),
//                                InkWell(
//                                 onTap: () {
//                                   _launchDialer(shopData['phonenumber']);
//                                 },
//                                 child: Row(
//                                   children: [
//                                     Icon(Icons.phone),
//                                     SizedBox(width: 8.0),
//                                     Text('Phone Number: ${shopData['phonenumber']}'),
//                             ],
//                           ),
//                         ),
//                             ],
//                           ),)
//                       );
//                     }).toList(),
//                   ),
//                 // if (shopDetails.isEmpty) Text('No shop data found'),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shopdirectoryapp/appbar.dart';
import 'dart:convert';
import 'drawer.dart';
import 'package:url_launcher/url_launcher.dart';

class SearchCategory extends StatefulWidget {
  final String category;

  SearchCategory({required this.category});

  @override
  _SearchCategoryState createState() => _SearchCategoryState();
}

class _SearchCategoryState extends State<SearchCategory> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController categoryController = TextEditingController();
  List<Map<String, dynamic>> shopDetails = [];

  Future<void> _fetchShopDetails(String category) async {
    try {
      final response = await http.get(
          Uri.parse('http://localhost:8000/api/shops/category/$category'));

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        List<Map<String, dynamic>> sortedShopDetails =
            List<Map<String, dynamic>>.from(data['data'] ?? []);

        // Sort shop details alphabetically based on shop name
        sortedShopDetails.sort((a, b) =>
            a['shopname'].toString().compareTo(b['shopname'].toString()));
        setState(() {
          shopDetails = sortedShopDetails;
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

  _launchDialer(dynamic phoneNumber) async {
    final url = 'tel:${phoneNumber.toString()}';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      // Handle error
      print('Could not launch $url');
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
      appBar: CommonAppBar(title: 'Search Category'),
      drawer: CommonDrawer(),
      body: Form(
        key: _formKey,
        child: ListView(
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
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a category';
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 16.0),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _fetchShopDetails(categoryController.text);
                      }
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
                                Padding(
                                  padding: const EdgeInsets.all(9.0),
                                  child: Row(
                                    children: [
                                      Icon(Icons.shop),
                                      SizedBox(width: 8.0),
                                      Text('Shop Name : ${shopData['shopname']}'),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(9.0),
                                  child: Row(
                                    children: [
                                      Icon(Icons.category),
                                      SizedBox(width: 8.0),
                                      Text('Category : ${shopData['category']}'),
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    _launchDialer(shopData['phonenumber']);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.all(9.0),
                                    child: Row(
                                      children: [
                                        Icon(Icons.phone),
                                        SizedBox(width: 8.0),
                                        Text(
                                            'Phone Number : ${shopData['phonenumber']}'),
                                      ],
                                    ),
                                  ),
                                ),
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
      ),
    );
  }
}
