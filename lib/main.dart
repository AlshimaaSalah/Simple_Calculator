import 'package:calculator/calculator_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        Calculator.routName: (_) => Calculator(),
      },
      initialRoute: Calculator.routName,
    );
  }
}
