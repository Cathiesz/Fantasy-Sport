import 'package:flutter/material.dart';
import 'package:flame/sprite.dart'; // imports the Animation class under animation.Animation
import 'package:flame/flame.dart'; // imports the Flame helper class
import 'package:flame/components.dart';
import 'package:flame/extensions.dart';
import 'package:flame/image_composition.dart';
import '../../chars/widgets/char.dart';
import 'package:flame/flame.dart';

class CharacterShown extends StatelessWidget {
  const CharacterShown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final key = new GlobalKey<ScaffoldState>();
    return Center(child: Card());
  }
}
