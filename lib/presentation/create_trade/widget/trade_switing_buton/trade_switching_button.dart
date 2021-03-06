import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_virtuality_saving_app/presentation/create_trade/widget/trade_switing_buton/trade_switching_button_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

//【貯金・支出】を切り替えるためのwidget

class TradeSwitingButton extends HookWidget {
  const TradeSwitingButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final indexState = useProvider(tradeSwitingButtonController).indexState;
    return Container(
      width: 250,
      child: CupertinoSlidingSegmentedControl(
        backgroundColor: Colors.grey[300]!,
        thumbColor: Colors.white,
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
          context.read(tradeSwitingButtonController.notifier).getCurrentIndex(index as int);
        },
      ),
    );
  }
}
