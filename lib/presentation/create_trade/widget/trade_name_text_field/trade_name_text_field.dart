import 'package:flutter/material.dart';
import 'package:flutter_virtuality_saving_app/presentation/common/text_field_card.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_virtuality_saving_app/presentation/create_trade/widget/trade_name_text_field/trade_name_text_field_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TradeNameTextField extends HookWidget {
  const TradeNameTextField({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final nameController =
        useProvider(tradeNameTextFieldController).textEdtingController;
    return TextFieldCard(textEditingController: nameController, title: "メモ");
  }
}
