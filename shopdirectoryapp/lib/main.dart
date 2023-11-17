import 'package:flutter/material.dart';
import 'package:shopdirectoryapp/about.dart';
import 'package:shopdirectoryapp/searchcategory.dart';
import 'testapi.dart';
import 'request.dart';
import 'search.dart';
import 'searchcategory.dart';

void main() {
  runApp(MaterialApp(home: MainApp()));
}

class MainApp extends StatelessWidget {
  var valueToPass;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('SHOP DIRECTORY APP'),
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: null,
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.search),
              title: Text('Search'),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => searchcategory(
                              category: '',
                            )));
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('About'),
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => About()));
              },
            ),
            ListTile(
              leading: Icon(Icons.request_page),
              title: Text('Request Form'),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => RequestForm()));
              },
            ),
          ],
        ),
      ),
       
      bottomNavigationBar: BottomNavigationBar(
        currentIndex:0,
        backgroundColor: Colors.blueAccent,
        items: [
          BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home,color: Colors.white,),),
        
          BottomNavigationBarItem(label:"Requestform",icon: Icon(Icons.account_circle,color: Colors.white,))
        ],
      ),
      // Additional content for the HomePage can be added here
    );
  }
}
