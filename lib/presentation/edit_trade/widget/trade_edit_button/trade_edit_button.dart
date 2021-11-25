import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_virtuality_saving_app/presentation/calendar_trade/widget/current_month_trade_list/widget/current_month_trade_list_controller.dart';
import 'package:flutter_virtuality_saving_app/presentation/create_trade/widget/trade_memo_text_field/trade_memo_text_field_controller.dart';
import 'package:flutter_virtuality_saving_app/presentation/create_trade/widget/trade_money_text_field/trade_money_text_field_controller.dart';
import 'package:flutter_virtuality_saving_app/presentation/create_trade/widget/trade_select_date/trade_select_date_controller.dart';
import 'package:flutter_virtuality_saving_app/presentation/create_trade/widget/trade_switing_buton/trade_switching_button_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_virtuality_saving_app/presentation/create_trade/widget/trade_name_text_field/trade_name_text_field_controller.dart';
import 'package:flutter_virtuality_saving_app/interactor/trade/trade_interactor_provider.dart';

class TradeEditButton extends HookWidget {
  const TradeEditButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final tradeNameTextEditingController = useProvider(tradeNameTextFieldController).textEdtingController;
    final tradeAmountMoneyController = useProvider(tradeAmountMoneyTextFieldController).textEdtingController;
    final tradeMemoController = useProvider(tradeMemoTextFieldController).textEdtingController;
    final tradeSwitchStateController = useProvider(tradeSwitingButtonController);
    final tradeDateController = useProvider(tradeSelectController);
    final interactor = useProvider(tradeInteractrorProvider.notifier);
    final idController = useProvider(tradeIdController);

    return CupertinoButton(
      child: Text("編集保存"),
      color: Colors.red,
      onPressed: () {
        interactor.updateTrade(
          id: idController.tradeId,
          name: tradeNameTextEditingController.text,
          memo: tradeMemoController.text,
          money: int.parse(tradeAmountMoneyController.text),
          judgement: tradeSwitchStateController.indexState,
          tradeDay: tradeDateController.selectedDate!,
        );
      },
    );
  }
}
