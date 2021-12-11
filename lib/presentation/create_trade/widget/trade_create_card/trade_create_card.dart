import 'package:flutter/material.dart';
import 'package:flutter_virtuality_saving_app/presentation/create_trade/widget/trade_memo_text_field/trade_memo_text_field.dart';
import 'package:flutter_virtuality_saving_app/presentation/create_trade/widget/trade_money_text_field/trade_money_text_field.dart';
import 'package:flutter_virtuality_saving_app/presentation/create_trade/widget/trade_name_text_field/trade_name_text_field.dart';
import 'package:flutter_virtuality_saving_app/presentation/create_trade/widget/trade_select_date/trade_select_date.dart';

class TradeCreateCard extends StatelessWidget {
  const TradeCreateCard({Key? key, required this.day}) : super(key: key);
  final DateTime day;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              TradeNameTextField(),
              Divider(height: 1),
              TradeMoneyTextField(),
              Divider(height: 1),
              TradeMemoTextField(),
              Divider(height: 1),
              TradeSelectDateField(day: day),
            ],
          ),
        ),
      ),
    );
  }
}
