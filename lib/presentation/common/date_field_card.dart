import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_virtuality_saving_app/presentation/create_trade/widget/trade_select_date/trade_select_date_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

//取引金額、取引名、メモを入力するTextFieldを囲うCardWidget
class DateFieldCard extends HookWidget {
  final String title;
  const DateFieldCard({Key? key, required this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final selectedDate = useProvider(tradeSelectController).selectedDate;
    final dateSelectController = useProvider(tradeSelectController.notifier);
    return Container(
      child: Column(
        children: [
          SizedBox(height: 40),
          Text(title),
          InkWell(
            child: SizedBox(
              width: double.infinity,
              height: 49,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    DateFormat('yyyy年M月d日').format(selectedDate!),
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              ),
            ),
            onTap: () {
              dateSelectController.selectDateFromPicker(context);
            }, //⬅️ここでDatePickerを表示する
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
