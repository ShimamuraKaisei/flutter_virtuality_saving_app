import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_virtuality_saving_app/presentation/create_trade/widget/trade_switing_buton/trade_switing_button_provider.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class TradeSwitingButton extends HookWidget {
  const TradeSwitingButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final indexState = useProvider(tradeSwitingButtonProvider); //useProvider
    return Container(
      width: 300,
      child: CupertinoSlidingSegmentedControl(
        backgroundColor: Colors.grey[300]!,
        thumbColor: Colors.amber[300]!,
        children: <int, Widget>{
          0: Text(
            '貯金',
            style: TextStyle(color: Colors.black),
          ),
          1: Text(
            '支出',
            style: TextStyle(color: Colors.black),
          ),
        },
        groupValue: indexState,
        onValueChanged: (index) {
          context
              .read(tradeSwitingButtonProvider.notifier)
              .getCurrentIndex(index!);
        },
      ),
    );
  }
}
