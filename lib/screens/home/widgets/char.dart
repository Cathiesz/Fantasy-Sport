import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:flame/sprite.dart';
import 'package:dashbook/dashbook.dart';

class Char extends FlameGame {

  @override
  Future<void> onLoad() async {
    await super.onLoad();
    final spriteSheet = SpriteSheet(
      image: await images.load('first.json'),
      srcSize: Vector2(16.0, 18.0),
    );

    final firstIdle =
        spriteSheet.createAnimation(row: 0, stepTime: 0.1, to: 7);

    final spriteSize = Vector2(80.0, 90.0);

    final firstComponent = SpriteAnimationComponent(
      animation: firstIdle,
      position: Vector2(150, 100),
      size: spriteSize,
    );

    add(firstComponent);

    // Some plain sprites
    final firstSpriteComponent = SpriteComponent(
      sprite: spriteSheet.getSprite(0, 0),
      position: Vector2(50, 100),
      size: spriteSize,
    );

    add(firstSpriteComponent);
  }
}