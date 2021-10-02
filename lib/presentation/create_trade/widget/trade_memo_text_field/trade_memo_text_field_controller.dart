import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

final tradeMemoTextFieldController =
    StateNotifierProvider<TradeMemoTextFieldController, TextEditingController>(
        (ref) => TradeMemoTextFieldController());

class TradeMemoTextFieldController
    extends StateNotifier<TextEditingController> {
  TradeMemoTextFieldController() : super(TextEditingController()); //初期化
}
