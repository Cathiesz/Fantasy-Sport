import 'package:flutter/material.dart';
import 'package:flame/animation.dart' as animation;
import 'package:flame/flame.dart';
import 'package:flame/position.dart';

class Homescreen extends StatelessWidget {
  Homescreen({Key? key}) : super(key: key);
  var WIDTH = 40.0;
  var HEIGHT = 40.0;
  var FRAME_WIDTH = 96.0;
  var AMOUNT = 4;

  @override
  Widget build(BuildContext context) {
    final key = new GlobalKey<ScaffoldState>();
    return Scaffold(
      key: key,
      appBar: AppBar(
        title: Text('Animation as a Widget Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Hi there! This is a regular Flutter app,'),
            Text('with a complex widget tree and also'),
            Text('some pretty sprite sheet animations :)'),
            Flame.util.animationAsWidget(
                Position(WIDTH, HEIGHT),
                animation.Animation.sequenced('mon1.png', AMOUNT,
                    textureWidth: FRAME_WIDTH)),
            Text('Neat, hum?'),
          ],
        ),
      ),
    );
  }
}
