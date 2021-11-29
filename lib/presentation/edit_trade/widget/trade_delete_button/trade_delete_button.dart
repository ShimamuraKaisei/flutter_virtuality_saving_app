import 'package:flutter/material.dart';
import 'package:flutter_virtuality_saving_app/interactor/trade/trade_interactor_provider.dart';
import 'package:flutter_virtuality_saving_app/presentation/calendar_trade/widget/current_month_trade_list/widget/current_month_trade_list_controller.dart';
import 'package:flutter_virtuality_saving_app/presentation/create_trade/widget/trade_memo_text_field/trade_memo_text_field_controller.dart';
import 'package:flutter_virtuality_saving_app/presentation/create_trade/widget/trade_money_text_field/trade_money_text_field_controller.dart';
import 'package:flutter_virtuality_saving_app/presentation/create_trade/widget/trade_name_text_field/trade_name_text_field_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/cupertino.dart';

class TradeDeleteButton extends HookWidget {
  const TradeDeleteButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final tradeInteractor = useProvider(tradeInteractrorProvider.notifier);
    final idController = useProvider(tradeIdController);
    final tradeNameTextEditingController = useProvider(tradeNameTextFieldController).textEdtingController;
    final tradeAmountMoneyController = useProvider(tradeAmountMoneyTextFieldController).textEdtingController;
    final tradeMemoController = useProvider(tradeMemoTextFieldController).textEdtingController;
    return BottomAppBar(
      child: InkWell(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) {
              return CupertinoAlertDialog(
                content: Text("削除してもよろしいですか？"),
                actions: [
                  CupertinoDialogAction(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text("キャンセル"),
                  ),
                  CupertinoDialogAction(
                    isDestructiveAction: true, //色を赤にする（？）
                    onPressed: () {
                      tradeInteractor.deleteTrade(id: idController.tradeId);
                      tradeNameTextEditingController.text = "";
                      tradeAmountMoneyController.text = "";
                      tradeMemoController.text = "";
                      Navigator.of(context).popUntil((route) => route.isFirst);
                    },
                    child: Text("削除"),
                  ),
                ],
              );
            },
          );
        },
        child: Container(
          height: 45,
          child: Center(
            child: Text(
              "削除",
              style: TextStyle(
                fontSize: 25,
                color: Colors.redAccent,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
