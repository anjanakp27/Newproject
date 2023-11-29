import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  final Widget child;

  BackgroundImage({required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/backgroundimage.jpg'), // Replace with your image path
              fit: BoxFit.cover,
            ),
          ),
        ),
        child,
      ],
    );
  }
}

//  Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Container(
//           decoration: BoxDecoration(
//             image: DecorationImage(
//               image: AssetImage('assets/backgroundimage.jpg'), // Replace with your image path
//               fit: BoxFit.cover,
//             ),
//           ),
//           child: Center(
//             child: Text(
//               'Hello, Flutter!',
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 24.0,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

