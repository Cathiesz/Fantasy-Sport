import 'package:flutter/services.dart';
import 'package:hello_world/screens/chars/widgets/char_data.dart';
import 'package:hello_world/screens/sports/widgets/list_records.dart';

var getData = CharData.getData;
ListRecords listRecords = ListRecords();

class SportMath {
  bool segmentStarted = false;

  String sport = "";
  int today = 0;
  int record = 0;

  SportMath(this.sport);

  getToday() {
    return today;
  }

  int getRecord() {
    return record;
  }

  setRecord(int today, var sport, int intSelected) async {
    //final prefs = await SharedPreferences.getInstance();
    if (this.today > record) {
      record = this.today;
      num challenge = getData[intSelected]["int-to-beat"] as int;
      if (record > challenge) {
        HapticFeedback.vibrate();
        listRecords.setUpdate(
            "${DateTime.now().day}.${DateTime.now().month}.${DateTime.now().year}",
            record,
            intSelected,
            true);
      }
    }
  }

  int incrementToday() {
    today += 1;
    return today;
  }

  identifyRep(int firstAcc, double upwardTreshold1, double downWardTreshold1,
      int secondAcc, double upwardTreshold2, double downWardTreshold2, int thirdAcc, double upwardTreshold3, double downWardTreshold3,  String s, int intSlectedIndex) {
    if (firstAcc >= upwardTreshold1 && secondAcc >= upwardTreshold2 && thirdAcc >= upwardTreshold3) {
      if (segmentStarted = false) {
        segmentStarted = true;
      }
    } else if (firstAcc < downWardTreshold1 && secondAcc < downWardTreshold2 && thirdAcc < downWardTreshold3) {
      if (segmentStarted = true) {
        segmentStarted = false;
        setRecord(today, sport, intSlectedIndex);
        incrementToday();
      }
    }
  }
}
