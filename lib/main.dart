import 'package:flutter/material.dart';

void main() {
  runApp(const AnaajApp());
}

class AnaajApp extends StatelessWidget {
  const AnaajApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(),
      home: Scaffold(
        appBar: AppBar(elevation: 0),
      ),
    );
  }
}
