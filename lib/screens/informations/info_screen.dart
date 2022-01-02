import 'package:flutter/material.dart';
import 'package:hello_world/screens/informations/widgets/informations.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // title: 'Fantasy Sport',
      theme: ThemeData(primarySwatch: Colors.lightGreen),
      home: const Information(),
    );
  }
}
