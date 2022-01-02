import 'package:flutter/material.dart';
import 'package:hello_world/screens/chars/widgets/char_data.dart';

var getData = CharData.getData;
var _shownImage = "assets/images/first.gif";

class CharsList extends StatelessWidget {
  const CharsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const title = ' Char List';
    return Container(
        child: GridView.count(
      // Create a grid with 2 columns. If you change the scrollDirection to
      // horizontal, this produces 2 rows.
      crossAxisCount: 2,
      // Generate 100 widgets that display their index in the List.
      children: List.generate(6, (index) {
        return Container(
            margin: const EdgeInsets.only(top: 10.0),
            height: 200,
            child: Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: InkWell(
                    splashColor: Colors.green.withAlpha(30),
                    onTap: () {
                      // ignore: unrelated_type_equality_checks
                      if (index == getData[index]) {
                        _setImage('${getData[index]['file']}');
                      }
                    },
                    child: Column(
                      children: [
                        Image.network('${getData[index]['file']}',
                            width: MediaQuery.of(context).size.width,
                            height: 96),
                        Text('${getData[index]['name']}',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(
                          '\n ${getData[index]['story']}',
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ))));
      }),
    ));
  }

  void _setImage(String image) {
    _shownImage = image;
  }

  String getImage() {
    return _shownImage;
  }
}
