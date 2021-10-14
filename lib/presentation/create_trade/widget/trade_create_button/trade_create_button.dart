import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_virtuality_saving_app/domain/entity/trade/trade.dart';
import 'package:flutter_virtuality_saving_app/presentation/create_trade/widget/trade_memo_text_field/trade_memo_text_field_controller.dart';
import 'package:flutter_virtuality_saving_app/presentation/create_trade/widget/trade_money_text_field/trade_money_text_field_controller.dart';
import 'package:flutter_virtuality_saving_app/presentation/create_trade/widget/trade_switing_buton/trade_switching_button_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_virtuality_saving_app/presentation/create_trade/widget/trade_name_text_field/trade_name_text_field_controller.dart';
import 'package:flutter_virtuality_saving_app/interactor/trade/trade_interactor_provider.dart';
//取引内容入力後の確定ボタン

class TradeCreateButton extends HookWidget {
  const TradeCreateButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final nameController = useProvider(tradeNameTextFieldController);
    final moneyController = useProvider(tradeAmountMoneyTextFieldController);
    final tradeMemoController = useProvider(tradeMemoTextFieldController);
    final indexController = useProvider(tradeSwitingButtonController);
    final tradeInteractor = useProvider(tradeInteractrorProvider.notifier);
    final tradeInteractorData = useProvider(tradeInteractrorProvider).data;
    return CupertinoButton(
      child: Text('保存'),
      color: Colors.red,
      onPressed: () {
        tradeInteractor.addTrade(
          name: nameController.textEdtingController.text,
          judgement: indexController.indexState,
          memo: tradeMemoController.textEdtingController.text,
          money: int.parse(
            moneyController.textEdtingController.text,
          ),
        );
        //⏬確認
        print(tradeInteractorData);

        debugPrint('--------------');
        debugPrint(nameController.textEdtingController.text);
        debugPrint(moneyController.textEdtingController.text);
        debugPrint(tradeMemoController.textEdtingController.text);
        debugPrint(indexController.indexState.toString());
      },
    );
  }
}
