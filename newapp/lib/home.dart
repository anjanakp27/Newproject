import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'firstscreen.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home')),
      body:
        Center(
          child: ElevatedButton.icon(
            onPressed: (){
              Navigator.pushNamed(context,'/firstscreen');
            },
             icon: Icon(Icons.home),
              label: Text('home'), ),
        ),
        );
  }
}
