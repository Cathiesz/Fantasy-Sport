import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:spritewidget/spritewidget.dart';
import 'dart:ui' as ui show Image;
import 'dart:async';

class Character extends StatefulWidget {
  const Character({Key? key}) : super(key: key);
  @override
  _CharacterState createState() => _CharacterState();
}

class _CharacterState extends State<Character> {
  late NodeWithSize rootNode;
  late ImageMap _images;
  late SpriteSheet _first;

  Future<Null> _loadAssets(AssetBundle bundle) async {
    _images = ImageMap(bundle);
    String json = await DefaultAssetBundle.of(context)
        .loadString('assets/images/first.json');
    _first = SpriteSheet(_images['asserts/images/first.png'], json);
  }

  @override
  void initState() {
    super.initState();
    rootNode = NodeWithSize(const Size(1024.0, 1024.0));
    AssetBundle bundle = rootBundle;
    _loadAssets(bundle).then((_) {
      setState(() {
        assetsLoaded = true;
      });
    });
  }

  bool assetsLoaded = false;

  @override
  Widget build(BuildContext context) {
    if (!assetsLoaded) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Buddy'),
        ),
        body: Container(
          decoration: const BoxDecoration(
            color: Color(0xff4aaafb),
          ),
        ),
      );
    }
    return Scaffold(
      body: SpriteWidget(rootNode),
    );
  }
}
