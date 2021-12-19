import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'widgets/sports_data.dart';

class SportsList extends StatelessWidget {
  var sportData = SportData.getData;

  SportsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: Container(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: ListView.builder(
                itemCount: sportData.length,
                itemBuilder: (context, index) {
                  return createContainer(index);
                }),
          ),
        ],
      ),
    )));
  }

  createContainer(index) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
      height: 220,
      width: double.maxFinite,
      child: Card(
        elevation: 5,
        child: Container(
          decoration: const BoxDecoration(
            border: Border(
                top: BorderSide(
              width: 2.0,
              color: Colors.green,
            )),
            color: Colors.white,
          ),
          child: Padding(
            padding: EdgeInsets.all(7),
            child: Stack(children: <Widget>[
              Align(
                alignment: Alignment.centerRight,
                child: Stack(
                  children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.only(left: 10, top: 5),
                        child: Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                const SizedBox(
                                  height: 10,
                                ),
                                sportNameSymbol(sportData[index]),
                                const Spacer(),
                                sportChange(sportData[index]),
                                const SizedBox(
                                  width: 10,
                                ),
                                const SizedBox(
                                  width: 20,
                                )
                              ],
                            ),
                            Row(
                              children: <Widget>[sportAmount(sportData[index])],
                            )
                          ],
                        ))
                  ],
                ),
              )
            ]),
          ),
        ),
      ),
    );
  }

  Widget sportNameSymbol(data) {
    return Align(
      alignment: Alignment.centerLeft,
      child: RichText(
        text: TextSpan(
          text: '${data['name']}',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.black, fontSize: 25),
          children: <TextSpan>[
            TextSpan(
                text: '\n${data['symbol']}',
                style: TextStyle(
                    color: Colors.green,
                    fontSize: 15,
                    fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget sportChange(data) {
    return Align(
      alignment: Alignment.topRight,
      child: RichText(
        text: TextSpan(
          text: 'Your Record: ${data['Record']}',
          style: TextStyle(
              fontWeight: FontWeight.bold, color: Colors.green, fontSize: 15),
        ),
      ),
    );
  }

  Widget sportAmount(data) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: Row(
          children: <Widget>[
            RichText(
              textAlign: TextAlign.left,
              text: TextSpan(
                text: '\n Today: ${data['Today']}',
                style: TextStyle(
                  color: Colors.green,
                  fontSize: 20,
                ),
                children: <TextSpan>[
                  TextSpan(
                      text: '\n This Week: ${data['This Week']}',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
