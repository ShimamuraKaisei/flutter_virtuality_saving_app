import 'package:flutter/material.dart';
import 'package:flutter_virtuality_saving_app/presentation/common/text_field_card.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_virtuality_saving_app/presentation/create_trade/widget/trade_money_text_field/trade_money_text_field_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TradeMoneyTextField extends HookWidget {
  const TradeMoneyTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moneyController = useProvider(tradeAmountMoneyTextFieldController).textEdtingController;
    return TextFieldCard(textEditingController: moneyController, title: "金額");
  }
}
