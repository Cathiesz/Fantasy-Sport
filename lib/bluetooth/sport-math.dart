import 'package:shared_preferences/shared_preferences.dart';

class SportMath {
  late SharedPreferences prefs;
  bool segmentStarted = false;
  String sport = "";
  int today = 0;
  int record = 0;

  SportMath(int today, int record, bool segmentStarted, String sport) {
    this.segmentStarted = segmentStarted;
    this.sport = sport;
    this.today = today;
    this.prefs = SharedPreferences.getInstance() as SharedPreferences;
  }

  getToday() {
    return today;
  }

  getRecord() {
    return record;
  }

  setRecord(int today, var sport) async {
    prefs = await SharedPreferences.getInstance();
    if (today > (prefs.getInt("record" + sport) ?? today)) {
      prefs.setInt("record" + sport, today);
      record = today;
    }
  }

  Future<int> incrementToday(int accZ) async {
    prefs = await SharedPreferences.getInstance();
    if (DateTime.now().day.toString() == (prefs.getString("today") ?? "")) {
      today = (prefs.getInt('today-' + sport) ?? 0) + 1;
      await prefs.setInt('today-' + sport, today);
    } else {
      prefs.setString("today", DateTime.now().day.toString());
      await prefs.setInt('today-' + sport, today++);
    }
    return today + 1;
  }

  Future<int> identifyRep(int zAcc, double upwardTreshold, String sport) async {
    if (zAcc >= upwardTreshold) {
      if (!segmentStarted) {
        segmentStarted = true;
      }
    } else if (zAcc < upwardTreshold) {
      if (segmentStarted) {
        segmentStarted = false;
        setRecord(today, sport);
        return incrementToday(zAcc);
      }
    }
    return today;
  }

  getThisWeek() {}
}
