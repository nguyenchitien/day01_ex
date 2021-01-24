import 'package:flutter/material.dart';
import 'package:layout_design/ex_1.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      // home: Scaffold(
      //   body: LayoutDesign(),
      //   floatingActionButton: FloatingActionButton(
      //     child: Icon(Icons.play_arrow_sharp),
      //   ),
      // ),
      home: Ex1(),
    );
  }
}
