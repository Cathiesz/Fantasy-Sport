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
        HapticFeedback.mediumImpact();
        HapticFeedback.heavyImpact();
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

  identifyRep(int zAcc, double upwardTreshold, double downWardTreshold,
      String sport, int intSelected) {
    if (zAcc >= upwardTreshold) {
      if (segmentStarted = false) {
        segmentStarted = true;
      }
    } else if (zAcc < downWardTreshold) {
      if (segmentStarted = true) {
        segmentStarted = false;
        setRecord(today, sport, intSelected);
        incrementToday();
      }
    }
  }
}
