import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_virtuality_saving_app/presentation/common/text_field_card.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_virtuality_saving_app/presentation/create_trade/widget/trade_memo_text_field/trade_memo_text_field_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TradeMemoTextField extends HookWidget {
  const TradeMemoTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final memoController = useProvider(tradeMemoTextFieldController).textEdtingController;
    return TextFieldCard(
      textEditingController: memoController,
      title: "メモ",
      type: TextInputType.text,
      format: FilteringTextInputFormatter.singleLineFormatter,
    );
  }
}
