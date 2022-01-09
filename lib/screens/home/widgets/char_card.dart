import 'package:flutter/material.dart';
import 'package:hello_world/screens/chars/chars.dart';
import './tooltip_char.dart';
import './tooltip_messages.dart';
import 'dart:math';

final _random = new Random();

class CharacterShown extends StatefulWidget {
  final int intSlectedIndex;

  CharacterShown({
    Key? key,
    required this.intSlectedIndex,
  }) : super(key: key);
  final tooltipmessage = TooltipMessages.getData;

  @override
  _CharacterShownState createState() => _CharacterShownState();
}

class _CharacterShownState extends State<CharacterShown> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: MyTooltip(
          message:
              '${widget.tooltipmessage[1 + _random.nextInt(5 - 1)]['text']}',
          child: Image.asset('${getData[widget.intSlectedIndex]['file']}')),
    );
  }
}
