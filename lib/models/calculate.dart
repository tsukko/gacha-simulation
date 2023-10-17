import 'dart:math';

import 'package:flutter/material.dart';

// ガチャ内のアイテムとそれぞれの出現確率
final gachaItems = {
  'SSR1': 0.02,
  'SSR': 0.04,
  'SR': 0.43,
  'R': 0.53,
};

// 指定したアイテムが当たるかどうかを確認する関数
bool isItemWon(String itemName) {
  final random = Random();
  final randomNumber = random.nextDouble(); // 0.0から1.0のランダムな数値を生成

  // ランダムな数値がアイテムの出現確率以下なら当たり
  return randomNumber < gachaItems[itemName]!;
}

void calcGetItem1() {
  final desiredItem = 'アイテムA'; // 欲しいアイテムを指定
  final numSimulations = 10000; // ガチャを試行する回数
  final n = 5; // アイテムAがn回連続して当たらない場合を計算

  int itemCount = 0; // 欲しいアイテムが出た回数をカウント

  for (int i = 0; i < numSimulations; i++) {
    bool won = false;
    int consecutiveFailures = 0;

    while (consecutiveFailures < n) {
      if (isItemWon(desiredItem)) {
        won = true;
        break;
      }
      consecutiveFailures++;
    }

    if (!won) {
      itemCount++;
    }
  }

  final loseProbability = itemCount / numSimulations;
  print('$n 回連続して $desiredItem が当たらない確率: ${loseProbability * 100}%');
}

double calcGetItemProbability(hit, times, probability) {
  // debugPrint('times : $times, probability: $probability');
  num probabilityaaa = 0.0;
  // n 回連続で外す確率
  switch (hit) {
    case 0:
      // ひとつもあたらない確率
      probabilityaaa = pow((1 - probability), times);
      debugPrint('$times 回連続して ひとつもあたらない確率:${probabilityaaa * 100}%');
      debugPrint('$times 回連続して ひとつ以上あたる確率　: ${(1 - probabilityaaa) * 100}%');
      break;
    case 1:
      probabilityaaa =
          times * pow((probability), 1) * (pow((1 - probability), (times - 1)));
      debugPrint('$times 回連続して ひとつあたる確率　　　: ${probabilityaaa * 100}%');
      break;
    case 2:
      probabilityaaa = (times * (times - 1) / 2) *
          pow((probability), 2) *
          pow((1 - probability), (times - 2));
      debugPrint('$times 回連続して 二つあたる確率　　　: ${probabilityaaa * 100}%');
      debugPrint('$times 回連続して 二つあたる確率aaaaaaa　　　: ${(times * (times - 1) / 2)}%');
      break;
    case 111:
      probabilityaaa = 1 - pow((1 - probability), times);
      debugPrint('$times 回連続して ひとつ以上あたる確率　: ${probabilityaaa * 100}%');
      break;
    default:
      print('【異常系】： switch文の引数になりえないデータです。');
      break;
  }

  return (probabilityaaa * 100).toDouble();
}

// x:試行回数、y:確率
List<dynamic> calcGetItemList(hit) {
  var probabilityList = <double>[];
  for (int i = 0; i <= 200; i++) {
    probabilityList.add(calcGetItemProbability(hit, i, gachaItems['SSR1']));
  }

  return probabilityList;
}
