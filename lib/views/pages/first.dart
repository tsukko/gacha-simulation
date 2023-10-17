import 'package:flutter/material.dart';

import '../../models/calculate.dart';
import '../../models/pricePoints.dart';
import '../../viewModels/lineChart.dart';
import '../slider.dart';

class First extends StatelessWidget {
  const First({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // calcGetItemProbability(0, 100, 0.02);
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            Stack(
              children: [
                LineChartWidget(pricePoints(0), Colors.red),
                LineChartWidget(pricePoints(1), Colors.blue),
                LineChartWidget(pricePoints(2), Colors.green),
              ],
            ),
            Card(
              color: Colors.green,
              // Cardの背景色
              margin: const EdgeInsets.all(30),
              // Cardの外側の余白を設定するオプション
              elevation: 8,
              // 影の離れ具合を調整するオプション
              shadowColor: Colors.black,
              child: Column(children: [
                Row(
                  children: [
                    // Checkbox(
                    //   activeColor: Colors.blue,
                    //   value: false,
                    //   onChanged: (bool? value) {},
                    // ),
                    const Expanded(flex: 1, child: Text('単体狙い')),
                    Expanded(
                      flex: 1,
                      child: Text("${gachaItems['SSR1']! * 100} %"),
                    ),
                  ],
                ),
                Row(children: [
                  const Expanded(flex: 1, child: Text('SSR')),
                  Expanded(
                    flex: 1,
                    child: Text("${gachaItems['SSR']! * 100} %"),
                  ),
                ]),
                Row(children: [
                  const Expanded(flex: 1, child: Text('SR')),
                  Expanded(
                    flex: 1,
                    child: Text("${gachaItems['SR']! * 100} %"),
                  ),
                ]),
                Row(children: [
                  const Expanded(flex: 1, child: Text('R')),
                  Expanded(
                    flex: 1,
                    child: Text("${gachaItems['R']! * 100} %"),
                  ),
                ])
              ]), // 影の色を設定するオプション
            ),
            ChangeForm(),
            OutlinedButton(
              child: const Text('Button'),
              style: OutlinedButton.styleFrom(
                primary: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                side: const BorderSide(),
              ),
              onPressed: () {
                calcGetItemProbability(0, 100, 0.02);
              },
            ),
            Card(
              color: Colors.blueGrey,
              margin: const EdgeInsets.all(24),
              elevation: 8,
              shadowColor: Colors.black,
              child: Container(
                margin: const EdgeInsets.all(16),
                child: const Column(children: [
                  Row(children: [
                    Expanded(
                      flex: 1,
                      child: Text('期待値：', style: TextStyle(fontSize: 18)),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text('43%', style: TextStyle(fontSize: 18)),
                    ),
                  ]),
                  Row(children: [
                    Expanded(
                      flex: 1,
                      child: Text('一回も出ない確率', style: TextStyle(fontSize: 18)),
                    ),
                    Expanded(
                      flex: 1,
                      child: Text('53%', style: TextStyle(fontSize: 18)),
                    ),
                  ])
                ]), // 影の色を設定するオプション
              ),
            ),
            Align(
              child: Card(
                margin: const EdgeInsets.all(16),
                child: Container(
                  margin: const EdgeInsets.all(16),
                  child: Text('医薬品名：', style: const TextStyle(fontSize: 18)),
                ),
              ),
            ),
            SizedBox(
              width: 300,
              height: 200,
              child: Card(
                child: Center(child: Text('Card2')),
                color: Colors.blue,
                margin: const EdgeInsets.all(30),
                elevation: 8,
                shadowColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(
              width: 300,
              height: 200,
              child: Card(
                margin: const EdgeInsets.all(30),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                clipBehavior:
                    Clip.antiAliasWithSaveLayer, // Cardと被ったWidgetをCardの形に保持する
                child: Row(
                  children: <Widget>[
                    // Image.network(
                    //     'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTo7FLZVev8PvE4IK3-1evSjzC65pUQzCartw&usqp=CAU'),
                    Spacer(),
                    Text('ねこかわいい'),
                    Spacer(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
