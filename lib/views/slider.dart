import 'package:flutter/material.dart';

import '../models/calculate.dart';

class ChangeForm extends StatefulWidget {
  _ChangeFormState createState() => _ChangeFormState();
}

class _ChangeFormState extends State<ChangeForm> {
  double _value = 100.0;
  final double _maxValue = 200.0;
  double _startValue = 100.0;
  double _endValue = 0.0;

  void _changeSlider(double e) => setState(() {
        _value = e;
      });

  void _startSlider(double e) => setState(() {
        _startValue = e;
      });

  void _endSlider(double e) => setState(() {
        _endValue = e;
      });

  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: <Widget>[
            Center(child: Text("試行回数：${_value.toStringAsFixed(0)} 回")),
            // Center(child:Text("開始時の値：${_startValue}")),
            // Center(child:Text("終了時の値：${_endValue}")),
            Slider(
              label: '${_value}',
              min: 0,
              max: _maxValue,
              value: _value,
              activeColor: Colors.orange,
              inactiveColor: Colors.blueAccent,
              divisions: _maxValue.toInt(),
              onChanged: _changeSlider,
              onChangeStart: _startSlider,
              onChangeEnd: _endSlider,
            ),
            Row(children: [
              const Expanded(flex: 2, child: Text('ひとつもあたらない確率')),
              Expanded(
                flex: 1,
                child: Text(
                    '${calcGetItemProbability(0, _value, 0.02).toStringAsFixed(2)} %'),
              ),
            ]),
            Row(children: [
              const Expanded(flex: 2, child: Text('ひとつあたる確率')),
              Expanded(
                flex: 1,
                child: Text(
                    '${calcGetItemProbability(1, _value, 0.02).toStringAsFixed(2)} %'),
              ),
            ]),
            Row(children: [
              const Expanded(flex: 2, child: Text('ふたつあたる確率')),
              Expanded(
                flex: 1,
                child: Text(
                    '${calcGetItemProbability(2, _value, 0.02).toStringAsFixed(2)} %'),
              ),
            ]),
            Row(children: [
              const Expanded(flex: 2, child: Text('ひとつ以上あたる確率')),
              Expanded(
                flex: 1,
                child: Text(
                    '${calcGetItemProbability(111, _value, 0.02).toStringAsFixed(2)} %'),
              ),
            ]),
          ],
        ));
  }
}
