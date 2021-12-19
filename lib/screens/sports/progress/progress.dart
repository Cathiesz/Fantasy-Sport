import 'package:flutter/material.dart';
import './progress_data.dart';

class ProgressWidget extends StatefulWidget {
  var progressdata = ProgressData.getData;

  ProgressWidget({Key? key}) : super(key: key);

  @override
  State<ProgressWidget> createState() => _ProgressWidgetState();
}

class _ProgressWidgetState extends State<ProgressWidget> {
  int _index = 0;
  var progressdata = ProgressData.getData;

  @override
  Widget build(BuildContext context) {
    return Stepper(
      currentStep: _index,
      onStepCancel: () {
        if (_index > 0) {
          setState(() {
            _index -= 1;
          });
        }
      },
      onStepContinue: () {
        if (_index <= 0) {
          setState(() {
            _index += 1;
          });
        }
      },
      onStepTapped: (int index) {
        setState(() {
          _index = index;
        });
      },
      steps: <Step>[
        Step(
          title: Text('Do a ${progressdata[1]['verb']} one time'),
          content: Container(
            alignment: Alignment.centerLeft,
            child: Text('${progressdata[1]['verb']} at least one time'),
          ),
        ),
        Step(
          title: Text('${progressdata[1]['verb']} 10 times'),
          content: Text('${progressdata[1]['verb']} at least 10 times'),
        ),
        Step(
            title: Text('Break your record of ${progressdata[1]['verb']}s'),
            content: Text('Break your record of ${progressdata[1]['verb']}s'))
      ],
    );
  }
}
