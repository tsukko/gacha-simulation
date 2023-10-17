import 'package:collection/collection.dart';

import 'calculate.dart';

class PricePoint {
  final double x;
  final double y;

  PricePoint({required this.x, required this.y});
}

List<PricePoint> pricePoints(hit) {
  final data = calcGetItemList(hit);
  return data
      .mapIndexed(
      ((index, element) => PricePoint(x: index.toDouble(), y: element)))
      .toList();
}
