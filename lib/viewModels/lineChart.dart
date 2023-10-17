import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../models/pricePoints.dart';

class LineChartWidget extends StatelessWidget {
  final List<PricePoint> points;
  final Color color;

  const LineChartWidget(this.points, this.color, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 2,
      child: LineChart(
          LineChartData(
          minX: 0.0,
          // maxX: 10.0,
          minY: 0.0,
          maxY: 100.0,

          lineBarsData: [
            LineChartBarData(
                spots: points.map((point) => FlSpot(point.x, point.y)).toList(),
                isCurved: true,
                color: color,
                dotData: const FlDotData(show: false))
          ],
            // タッチ操作時の設定
            lineTouchData: LineTouchData(
              handleBuiltInTouches: true,                        // タッチ時のアクションの有無
              getTouchedSpotIndicator: defaultTouchedIndicators, // インジケーターの設定
              touchTooltipData: LineTouchTooltipData(            // ツールチップの設定
                getTooltipItems: defaultLineTooltipItem,         // 表示文字設定
                tooltipBgColor: Colors.white,                    // 背景の色
                tooltipRoundedRadius: 2.0,                       // 角丸
              ),
            ),
            // グラフのタイトル設定
            titlesData: FlTitlesData(
                // show: true,                          // タイトルの有無
                // bottomTitles: AxisTitles(            // 下側に表示するタイトル設定
                //   axisNameWidget: Text("【曜日】",      // タイトル名
                //     style: TextStyle(
                //       color: Color(0xff68737d),
                //     ),
                //   ),
                //   axisNameSize: 22.0,                     // タイトルの表示エリアの幅
                //   sideTitles: SideTitles(                 // サイドタイトル設定
                //     showTitles: true,                     // サイドタイトルの有無
                //     interval: 1.0,                        // サイドタイトルの表示間隔
                //     reservedSize: 40.0,                   // サイドタイトルの表示エリアの幅
                //     // getTitlesWidget: bottomTitleWidgets,  // サイドタイトルの表示内容
                //   ),
                // ),
                // rightTitles: AxisTitles(),                // 上記と同じため割愛
                // topTitles: AxisTitles(),
                // rightTitles: AxisTitles()
            ),
          )),
    );
  }
}
