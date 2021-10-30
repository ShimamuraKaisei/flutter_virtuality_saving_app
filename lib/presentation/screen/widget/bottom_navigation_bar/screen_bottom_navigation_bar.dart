import 'package:flutter/material.dart';
import 'package:flutter_virtuality_saving_app/presentation/screen/widget/bottom_navigation_bar/screen_bottom_navigation_bar_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

//【入力画面・分析画面・設定画面】を切り替えるためのwidget
class ScreenBottomNavigationBar extends HookWidget {
  const ScreenBottomNavigationBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final indexStateNav = useProvider(bottomNavigationController).indexState;
    // final tradeInteractor =
    //     useProvider(tradeInteractrorProvider.notifier); //notifierで関数にアクセス
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      onTap: (int index) {
        context
            .read(bottomNavigationController.notifier)
            .getCurrentIndex(index);
        // tradeInteractor.getTradeAll();
      },
      currentIndex: indexStateNav,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.create),
          label: '入力',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.analytics),
          label: '分析',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.calendar_today),
          label: 'カレンダー',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: '設定',
        ),
      ],
    );
  }
}
