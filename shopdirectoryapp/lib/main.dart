import 'package:flutter/material.dart';
import 'testapi.dart';
import 'search.dart';
void main() {
  runApp(MaterialApp(home: HomePage()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(centerTitle: true,
          title: Text(
           'SHOP DIRECTORY APP'),
          ),
      
      
      );
    
  
}
}