import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_virtuality_saving_app/presentation/common/notification_dialog.dart';
import 'package:flutter_virtuality_saving_app/presentation/create_trade/widget/trade_memo_text_field/trade_memo_text_field_controller.dart';
import 'package:flutter_virtuality_saving_app/presentation/create_trade/widget/trade_money_text_field/trade_money_text_field_controller.dart';
import 'package:flutter_virtuality_saving_app/presentation/create_trade/widget/trade_select_date/trade_select_date_controller.dart';
import 'package:flutter_virtuality_saving_app/presentation/create_trade/widget/trade_switing_buton/trade_switching_button_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_virtuality_saving_app/presentation/create_trade/widget/trade_name_text_field/trade_name_text_field_controller.dart';
import 'package:flutter_virtuality_saving_app/interactor/trade/trade_interactor_provider.dart';
import 'package:flutter_virtuality_saving_app/presentation/calendar_trade/widget/calendar_trade/clendar_trade_controller.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';
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
    final tradeDateController = useProvider(tradeSelectController);
    return CupertinoButton(
      child: Text('保存'),
      color: Colors.blue[400],
      onPressed: () {
        var uuid = Uuid().v1(); //一意のIDを生成
        if (nameController.textEdtingController.text == "" || moneyController.textEdtingController.text == "") {
          showDialog(
            context: context,
            builder: (context) {
              return NotificationAlertDialog(title: '正しく値を入力してください');
            },
          );
        } else {
          showDialog(
            context: context,
            builder: (context) {
              return NotificationAlertDialog(title: '追加しました');
            },
          );
          tradeInteractor.addTrade(
            //Tradeデータの生成
            id: uuid,
            name: nameController.textEdtingController.text,
            judgement: indexController.indexState,
            memo: tradeMemoController.textEdtingController.text,
            money: int.parse(moneyController.textEdtingController.text),
            tradeDay: tradeDateController.selectedDate!,
          );
          //⏬textFieldの中身を初期化
          nameController.textEdtingController.text = "";
          moneyController.textEdtingController.text = "";
          tradeMemoController.textEdtingController.text = "";
        }
      },
    );
  }
}
