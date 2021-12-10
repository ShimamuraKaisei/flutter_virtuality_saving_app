import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_virtuality_saving_app/presentation/common/money_text_field_card/money_text_field_card.dart';
import 'package:flutter_virtuality_saving_app/presentation/common/text_field_card.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_virtuality_saving_app/presentation/create_trade/widget/trade_money_text_field/trade_money_text_field_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TradeMoneyTextField extends HookWidget {
  const TradeMoneyTextField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moneyController = useProvider(tradeAmountMoneyTextFieldController).textEdtingController;
    return MoneyTextFieldCard(
      textEditingController: moneyController,
      title: "金額",
      type: TextInputType.number,
      format: FilteringTextInputFormatter.digitsOnly, //コピペで数字以外がフィールドに入力されることを防ぐ
      // focusNode: FocusNode(),
    );
  }
}
