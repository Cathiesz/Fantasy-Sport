import 'package:flutter/material.dart';
import 'package:hello_world/screens/chars/chars.dart';
import './tooltip_char.dart';
import './tooltip_messages.dart';
import 'dart:math';

final _random = new Random();

class CharacterShown extends StatelessWidget {
  CharsList char = CharsList();
  final ValueNotifier<String> _img = ValueNotifier("assets/images/second.gif");
  var tooltipmessage = TooltipMessages.getData;

  CharacterShown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<String>(
        valueListenable: _img,
        builder: (context, value, child) {
          return Center(
            child: MyTooltip(
                message:
                    '${tooltipmessage[1 + _random.nextInt(5 - 1)]['text']}',
                child: Image.asset("assets/images/first.gif")),
          );
        });
  }
}
