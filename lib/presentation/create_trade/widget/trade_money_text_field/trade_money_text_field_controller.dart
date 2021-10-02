import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

final tradeAmountMoneyTextFieldController = StateNotifierProvider<
    TradeAmountMoneyTextFieldController,
    TextEditingController>((ref) => TradeAmountMoneyTextFieldController());

class TradeAmountMoneyTextFieldController
    extends StateNotifier<TextEditingController> {
  TradeAmountMoneyTextFieldController() : super(TextEditingController()); //初期化
}
