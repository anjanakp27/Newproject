import 'package:flutter/material.dart';

void main() {
  runApp(const HomePage());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(centerTitle: true,
          title: Text(
           'SHOP DIRECTORY APP'),
          ),
       
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Center(
                child: Card(
                
                  margin: EdgeInsets.all(10),
                  elevation: 8 ,
                  child: Container(
                    padding: EdgeInsets.all(25),
                    child: Text('HOSPITALS',
                    
                    style: TextStyle(
                      color: Colors.blue
                    ),
                    
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 4,
              ),
                Center(
                  child: Card(
                  margin: EdgeInsets.all(20),
                  elevation: 8 ,
                  child: Container(
                    padding: EdgeInsets.all(25),
                    child: Text('SHOPS',
                    style: TextStyle(
                      color: Colors.blue
                    ),
                    ),
                  ),
                            ),
                            
                ),
                Center(
                child: Card(
                  margin: EdgeInsets.all(20),
                  elevation: 8 ,
                  child: Container(
                    padding: EdgeInsets.all(25),
                    child: Text('SCHOOLS',
                    style: TextStyle(
                      color: Colors.blue
                    ),
                    ),
                  ),
                ),
              ),
              Center(
                child: Card(
                  margin: EdgeInsets.all(20),
                  elevation: 8 ,
                  child: Container(
                    padding: EdgeInsets.all(25),
                    child: Text('COLLEGES',
                    style: TextStyle(
                      color: Colors.blue
                    ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        )
      ),
      );
    
  
}
}