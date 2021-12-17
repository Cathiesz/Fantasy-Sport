import 'package:flutter/material.dart';
import './screens/home/home.dart';

void main() {
  runApp(const FantasySport());
}

class FantasySport extends StatelessWidget {
  const FantasySport({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Fantasy Sport',
      theme: ThemeData(primarySwatch: Colors.lightGreen),
      home: const HomeScreen(),
    );
  }
}
