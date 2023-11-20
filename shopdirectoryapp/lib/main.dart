import 'package:flutter/material.dart';
import 'package:shopdirectoryapp/about.dart';
import 'package:shopdirectoryapp/searchcategory.dart';
import 'testapi.dart';
import 'request.dart';
import 'search.dart';
import 'searchcategory.dart';
import 'sample.dart';

void main() {
  runApp( MaterialApp(home: MainApp(),));
}


class CommonDrawer extends StatelessWidget {
  const CommonDrawer({super.key});

  @override
  Widget build(BuildContext context) {
   return Drawer(
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
                      builder: (context) => searchcategory(category: '')));
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
    );
  }
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});


  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  var valueToPass;

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
          BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home,color: Colors.white,),),
        
          BottomNavigationBarItem(label:"Requestform",icon: Icon(Icons.account_circle,color: Colors.white,))
        ],
      
      ),
    
    body: HomePage(),   // Additional content for the HomePage can be added here
    
    );
 
  }
}


// class MainApp extends StatelessWidget {
//   var valueToPass;

//   @override
//   Widget build(BuildContext context) {
    
//     return Scaffold(
    
      
//      appBar: AppBar(
      
//         centerTitle: true,
        
//         title: Text(''),
//       ),
      
      
//    drawer: CommonDrawer(),
    
  
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex:0,
//         backgroundColor: Colors.blueAccent,
//         items: [
//           BottomNavigationBarItem(label: "Home", icon: Icon(Icons.home,color: Colors.white,),),
        
//           BottomNavigationBarItem(label:"Requestform",icon: Icon(Icons.account_circle,color: Colors.white,))
//         ],
      
//       ),
    
//     body: HomePage(),   // Additional content for the HomePage can be added here
    
//     );
 
//   }
// }





