import 'package:shared_preferences/shared_preferences.dart';

class SportMath {
  bool segmentStarted = false;
  String sport = "";
  int today = 0;
  int record = 0;

  SportMath(int today, int record, bool segmentStarted, String sport) {
    this.segmentStarted = segmentStarted;
    this.sport = sport;
    this.today = today;
    this.record = today;
  }

  getRep(int today, int record, var sportType) {
    if (today >= record) {
      //setRecord(sportType, today);
    }
  }

  incrementToday() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (DateTime.now().day.toString() == prefs.getString("today")) {
      today = (prefs.getInt('today-' + sport) ?? 0) + 1;
      await prefs.setInt('today-' + sport, today);
    } else {
      prefs.setString("today", DateTime.now().day.toString());
      await prefs.setInt('today-' + sport, 1);
    }
  }

  identifyRep(int z_acc) async {
    double _upwardTreshold = 12.0;

    if (z_acc >= _upwardTreshold) {
      if (!segmentStarted) {
        segmentStarted = true;
      }
    }
    if (z_acc < _upwardTreshold) {
      if (segmentStarted) {
        incrementToday();
        segmentStarted = false;
      }
    }
  }
}
