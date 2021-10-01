import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:state_notifier/state_notifier.dart';

final bottomNavigationProvider =
    StateNotifierProvider<BottomNavigationStateNotifier, int>(
        (_) => BottomNavigationStateNotifier());

class BottomNavigationStateNotifier extends StateNotifier<int> {
  BottomNavigationStateNotifier() : super(0); //0で初期化
  void getCurrentIndex(int index) {
    state = index;
  }
}

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
          icon: Icon(Icons.ac_unit),
          label: '入力',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.ac_unit),
          label: '分析',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.ac_unit),
          label: '設定',
        ),
      ],
    );
  }
}
