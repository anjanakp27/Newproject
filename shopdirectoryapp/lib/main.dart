import 'package:flutter/material.dart';
import 'testapi.dart';
import 'request.dart';
import 'search.dart';

void main() {
  runApp(MaterialApp(home:RequestForm()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  
  get valueToPass => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text('SHOP DIRECTORY APP'),
      // routes: {
      //   '/': (context) => HomePage(),
      //   '/categorylist': (context) =>
      //      Getcategory(category: valueToPass),
      //   '/request': (context) => const RequestForm()
      // },
      // initialRoute: '/',
    ),
    );
  }
}
