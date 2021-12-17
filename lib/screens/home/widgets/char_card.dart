import 'package:flame/game.dart';
import 'package:flutter/material.dart';
import 'package:flame/components.dart';
import './char.dart';

class CharWidget extends StatelessWidget {
  CharWidget({Key? key}) : super(key: key);
  SpriteComponent first = SpriteComponent();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        child: GameWidget(game: Char()),
      ),
    );
  }
}
