import 'package:shared_preferences/shared_preferences.dart';

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

  getRecord() {
    return record;
  }

  setRecord(int today, var sport) {
    if (this.today > record) {
      record = this.today;
    }
  }

  int incrementToday() {
    today += 1;
    return today;
  }

  identifyRep(int zAcc, double upwardTreshold, double downWardTreshold, String sport) {
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
