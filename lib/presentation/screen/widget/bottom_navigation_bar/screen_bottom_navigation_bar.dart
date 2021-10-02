import 'package:flutter/material.dart';
import 'package:flutter_virtuality_saving_app/presentation/screen/widget/bottom_navigation_bar/screen_bottom_navigation_bar_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ScreenBottomNavigationBar extends HookWidget {
  const ScreenBottomNavigationBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final indexState = useProvider(bottomNavigationProvider);

    return BottomNavigationBar(
      onTap: (int index) {
        context.read(bottomNavigationProvider.notifier).getCurrentIndex(index);
      },
      currentIndex: indexState,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.rate_review),
          label: '入力',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.analytics),
          label: '分析',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: '設定',
        ),
      ],
    );
  }
}
