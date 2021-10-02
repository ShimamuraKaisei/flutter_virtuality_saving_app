import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_virtuality_saving_app/presentation/create_trade/widget/trade_memo_text_field/trade_memo_text_field_controller.dart';
import 'package:flutter_virtuality_saving_app/presentation/create_trade/widget/trade_money_text_field/trade_money_text_field_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_virtuality_saving_app/presentation/create_trade/widget/trade_name_text_field/trade_name_text_field_controller.dart';
//取引内容入力後の確定ボタン

class TradeCreateButton extends HookWidget {
  const TradeCreateButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final tradeNameController = useProvider(tradeNameTextFieldController);
    final tradeMoneyController =
        useProvider(tradeAmountMoneyTextFieldController);
    final tradeMemoController = useProvider(tradeMemoTextFieldController);
    return CupertinoButton(
      child: Text('保存'),
      color: Colors.red,
      onPressed: () {
        print(tradeNameController.text);
        print(tradeMoneyController.text);
        print(tradeMemoController.text);
        // ignore: todo
        //TODO:保存処理
      },
    );
  }
}
