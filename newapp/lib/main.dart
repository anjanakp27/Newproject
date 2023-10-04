import 'package:flutter/material.dart';
import 'firstscreen.dart';
import 'home.dart';


void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      routes: {
        '/':(context)=>home(),
      
          '/firstscreen':(context)=>firstscreen(),

      },
   initialRoute: '/',
        );
            
      
  }
}
