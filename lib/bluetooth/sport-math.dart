class SportMath {
  getRep(int today, int record, var sportType) {
    if (today >= record) {
      //setRecord(sportType, today);
    }
  }

  identifyRep(int z_acc) {
    double _upwardTreshold = 12.0;

    bool _segmentStarted = false;
    var _segmentStartLocation = [];
    var _segmentEndLocation = [];

    if (z_acc >= _upwardTreshold) {
      if (!_segmentStarted) {
        _segmentStarted = true;
      }
    }
    if (z_acc < _upwardTreshold) {
      if (_segmentStarted) {
        _segmentStarted = false;
      }
    }
  }
}
