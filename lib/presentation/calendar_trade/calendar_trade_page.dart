import 'package:flutter/material.dart';
import 'package:flutter_virtuality_saving_app/presentation/calendar_trade/widget/calendar_trade/calendar_trade.dart';
import 'package:flutter_virtuality_saving_app/presentation/calendar_trade/widget/current_month_trade_list/current_month_trade_list.dart';
import 'package:flutter_virtuality_saving_app/presentation/calendar_trade/widget/view_trade_money_difference/view_trade_money_difference.dart';

class CalendarTradePage extends StatelessWidget {
  const CalendarTradePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            CalendarTrade(),
            ViewTradeMoneyDifference(),
            CurrentMonthTradeList(),
          ],
        ),
      ),
    );
  }
}
