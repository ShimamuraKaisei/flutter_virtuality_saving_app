import 'package:flutter_virtuality_saving_app/presentation/create_trade/widget/trade_select_date/trade_select_date_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:flutter/material.dart';

final tradeSelectController =
    StateNotifierProvider<TradeSelectController, TradeSelectDateState>(
        (ref) => TradeSelectController());

class TradeSelectController extends StateNotifier<TradeSelectDateState> {
  TradeSelectController()
      : super(TradeSelectDateState(selectedDate: DateTime.now())); //今日の日付で初期化
  void selectDateFromPicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        locale: const Locale("ja"),
        initialDate: state.selectedDate!,
        firstDate: new DateTime(2016),
        lastDate: new DateTime.now().add(new Duration(days: 360)));
    if (picked != null) {
      state = TradeSelectDateState(selectedDate: picked);
    }
  }
}
