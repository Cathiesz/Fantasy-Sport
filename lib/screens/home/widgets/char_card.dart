import 'package:flutter/material.dart';

class CharacterShown extends StatelessWidget {
  const CharacterShown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: <Widget>[
        Image.network('assets/images/first.gif', width: 80, height: 96)
      ],
    ));
  }
}
