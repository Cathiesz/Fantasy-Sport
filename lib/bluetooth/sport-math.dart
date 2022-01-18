import 'package:hello_world/screens/chars/widgets/char_data.dart';
import 'package:hello_world/screens/home/widgets/sports_widget.dart';
import 'package:shared_preferences/shared_preferences.dart';

var getData = CharData.getData;

class SportMath {
  bool segmentStarted = false;

  String sport = "";
  int today = 0;
  int record = 0;

  SportMath(String sport) {
    this.sport = sport;
  }

  getToday() {
    return today;
  }

  getRecord() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('record' + sport, record);
    return record;
  }

  setRecord(int today, var sport) async {
    final prefs = await SharedPreferences.getInstance();
    if (this.today > record) {
      record = this.today;
    }
  }

  updateRecords(int intSelected) {
    if (getData[intSelected]["challenge-int"].toString() ==
        record.toString()) {}
  }

  int incrementToday() {
    today += 1;
    return today;
  }

  identifyRep(
      int zAcc, double upwardTreshold, double downWardTreshold, String sport) {
    if (zAcc >= upwardTreshold) {
      if (segmentStarted = false) {
        segmentStarted = true;
      }
    } else if (zAcc < downWardTreshold) {
      if (segmentStarted = true) {
        segmentStarted = false;
        setRecord(today, sport);
        incrementToday();
      }
    }
  }

  getThisWeek() {}
}
