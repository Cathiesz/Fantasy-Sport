import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hello_world/screens/chars/widgets/char_data.dart';
import 'package:hello_world/screens/home/widgets/char_card.dart';
import 'package:shared_preferences/shared_preferences.dart';

var getData = CharData.getData;
int selectedIndex = 0;

class CharList extends StatefulWidget {
  const CharList({Key? key}) : super(key: key);

  @override
  _CharListState createState() => _CharListState();

  static int getState() {
    return selectedIndex;
  }
}

class _CharListState extends State<CharList> {
  @override
  void initState() {
    super.initState();
    _loadIndex();
  }

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
            height: 230,
            child: Card(
                semanticContainer: true,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: InkWell(
                    splashColor: Colors.green.withAlpha(30),
                    onTap: () {
                      _changeIndex(index);
                    },
                    child: Column(
                      children: [
                        Image.asset('${getData[index]['file']}',
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

  void _changeIndex(int index) async {
    final prefs = await SharedPreferences.getInstance();

    setState(() {
      selectedIndex = index;
      prefs.setInt("shownChar", index);
    });
  }

  void _loadIndex() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      selectedIndex = (prefs.getInt('shownChar') ?? 0);
    });
  }
}
