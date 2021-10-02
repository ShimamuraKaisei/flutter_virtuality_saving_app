import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

final tradeNameTextFieldController =
    StateNotifierProvider<TradeNameTextFieldController, TradeNameTextState>(
        (ref) => TradeNameTextFieldController());

class TradeNameTextFieldController extends StateNotifier<TradeNameTextState> {
  TradeNameTextFieldController() : super(TradeNameTextState()); //初期化
}
