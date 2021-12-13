import 'package:flutter/material.dart';

class Chars extends StatelessWidget {
  const Chars({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const title = ' Char List';
    return MaterialApp(
        title: title,
        home: Scaffold(
            body: GridView.count(
          // Create a grid with 2 columns. If you change the scrollDirection to
          // horizontal, this produces 2 rows.
          crossAxisCount: 2,
          // Generate 100 widgets that display their index in the List.
          children: List.generate(20, (index) {
            return Center(
              child: Text(
                'Item $index',
                style: Theme.of(context).textTheme.headline5,
              ),
            );
          }),
        )));
  }
}
