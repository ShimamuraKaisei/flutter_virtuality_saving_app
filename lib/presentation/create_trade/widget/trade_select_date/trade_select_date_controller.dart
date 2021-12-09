import 'package:flutter_virtuality_saving_app/presentation/create_trade/widget/trade_select_date/trade_select_date_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

final tradeSelectController = StateNotifierProvider<TradeSelectController, TradeSelectDateState>((ref) => TradeSelectController());

class TradeSelectController extends StateNotifier<TradeSelectDateState> {
  TradeSelectController() : super(TradeSelectDateState(selectedDate: DateTime.now())); //今日の日付で初期化
  void selectDateFromPicker(BuildContext context) async {
    // final DateTime? picked = await showDatePicker(
    //   context: context,
    //   locale: const Locale("ja"),
    //   initialDate: state.selectedDate!,
    //   firstDate: new DateTime(2016),
    //   lastDate: new DateTime.now().add(
    //     new Duration(days: 360),
    //   ),
    // );
    DateTime? picked;
    showCupertinoModalPopup(
      context: context,
      builder: (_) => Container(
        height: 260,
        color: Color.fromARGB(255, 255, 255, 255),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // Close the modal
            Container(
              decoration: BoxDecoration(
                color: Color(0xffffffff),
                border: Border(
                  bottom: BorderSide(
                    color: Color(0xff999999),
                    width: 0.0,
                  ),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CupertinoButton(
                    child: Text("キャンセル"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  CupertinoButton(
                    child: Text('OK'),
                    onPressed: () {
                      if (picked != null) {
                        state = TradeSelectDateState(selectedDate: picked);
                      }
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
            Container(
              height: 200,
              // padding: const EdgeInsets.only(top: 6.0),
              child: CupertinoDatePicker(
                mode: CupertinoDatePickerMode.date, //日付限定
                initialDateTime: state.selectedDate!,
                onDateTimeChanged: (val) {
                  picked = val;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void selectDateOnTap(DateTime day) {
    state = TradeSelectDateState(selectedDate: day);
  }
}
