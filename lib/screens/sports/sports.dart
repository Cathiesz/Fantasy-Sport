import 'package:flutter/material.dart';

class SportsList extends StatelessWidget {
  const SportsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     return MaterialApp(
     home: Scaffold(
    body: Container(
      padding: EdgeInsets.fromLTRB(10,10,10,0),
      height: 220,
      width: double.maxFinite,
      child: Card(
        elevation: 5,
        ),
      ),
     ),
   );
  }
}
