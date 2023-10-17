import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'first.dart';
import 'second.dart';

final provider = StateProvider((ref) => ViewType.first);

enum ViewType { first, second, test1, test2 }

class Top extends ConsumerWidget {
  // const Top({
  //   super.key,
  // });

  // 選択中フッターメニューのインデックスを一時保存する用変数
  // int selectedIndex = 0;
  // 切り替える画面のリスト
  // List<Widget> display = [First(), Second()];
  final pages = [
    First(),
    Second(),
    First(),
    Second(),
  ];

  Top({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final view = ref.watch(provider);

    return Scaffold(
      body: SafeArea(
        child: DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              title: Text(view.name),
            ),
            body: pages[view.index],
            // body: CustomScrollView(
            //   slivers: [
            //     const SliverAppBar(
            //       floating: true,
            //       title: Text("Title"),
            //     ),
            //     SliverList(
            //       delegate: SliverChildListDelegate(
            //         [
            //           for (var i = 0; i < 5; i++)
            //             ListTile(
            //               title: Text("item $i"),
            //             ),
            //           pages[view.index],
            //         ],
            //       ),
            //     ),
            //   ],
            // ),
            bottomNavigationBar: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(icon: Icon(Icons.home), label: 'ホーム'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite), label: 'お気に入り'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.notifications), label: 'お知らせ'),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: 'アカウント'),
              ],
              currentIndex: view.index,
              onTap: (int index) {
                print("aaadddd view.index;${view.index}");
                ref.read(provider.notifier).state = ViewType.values[index];
              },
              type: BottomNavigationBarType.fixed,
            ),
          ),
        ),
      ),
    );
  }
}
