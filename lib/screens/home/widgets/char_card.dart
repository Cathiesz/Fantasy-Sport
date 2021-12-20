import 'package:flutter/material.dart';
import './tooltip_char.dart';

class CharacterShown extends StatelessWidget {
  const CharacterShown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MyTooltip(
          message: 'message',
          child:
              Image.network('assets/images/first.gif', width: 80, height: 96)),
    );
  }
}
