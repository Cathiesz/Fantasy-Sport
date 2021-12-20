import 'package:flutter/material.dart';

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
      children: List.generate(20, (index) {
        return Card(
          child: InkWell(
              splashColor: Colors.green.withAlpha(30),
              onTap: () {
                debugPrint('Card tapped.');
              },
              child: Image.network('assets/images/first.gif',
                  width: 200, height: 96)),
        );
      }),
    ));
  }
}
