import 'package:flutter/material.dart';
import 'package:hello_world/screens/chars/chars.dart';
import './tooltip_char.dart';
import './tooltip_messages.dart';
import 'dart:math';

final _random = new Random();

class CharacterShown extends StatelessWidget {
  CharsList char = CharsList();
  var tooltipmessage = TooltipMessages.getData;

  CharacterShown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: MyTooltip(
          message: '${tooltipmessage[1 + _random.nextInt(5 - 1)]['text']}',
          child: Image.network(char.getImage(),
              width: MediaQuery.of(context).size.width, height: 512)),
    );
  }
}
