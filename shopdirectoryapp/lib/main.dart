import 'package:flutter/material.dart';
import 'package:shopdirectoryapp/about.dart';
import 'package:shopdirectoryapp/searchcategory.dart';
import 'testapi.dart';
import 'request.dart';
import 'search.dart';
import 'searchcategory.dart';
import 'drawer.dart';

void main() {
  runApp( MaterialApp(home: MainApp(),));
}




class MainApp extends StatefulWidget {
  const MainApp({super.key});


  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  var valueToPass;
   final List<Widget> _pages = [
    HomePage(),
    RequestForm(),
  
  ];
   int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
     return Scaffold(
    
      
     appBar: AppBar(
      
        centerTitle: true,
        
        title: Text('Shop Directory App'),
      ),
      
      
   drawer: CommonDrawer(),
   
  
      bottomNavigationBar: BottomNavigationBar(
        currentIndex:0,
        backgroundColor: Colors.blueAccent,
        items: [
          BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home,color: Colors.white),
         
        ),
        
          BottomNavigationBarItem(label:"Requestform",icon: Icon(Icons.account_circle,color: Colors.white,))
        ],
      
      ),
    
    body: HomePage(),   // Additional content for the HomePage can be added here
    
     );
 
  }
}


// 





