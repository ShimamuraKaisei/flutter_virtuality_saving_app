import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_virtuality_saving_app/presentation/calendar_trade/widget/view_trade_money_difference/widget/expenditure_trades.dart';
import 'package:flutter_virtuality_saving_app/presentation/calendar_trade/widget/view_trade_money_difference/widget/revene_trades.dart';
import 'package:flutter_virtuality_saving_app/presentation/calendar_trade/widget/view_trade_money_difference/widget/virtual_savings.dart';

class ViewTradeMoneyDifference extends HookWidget {
  const ViewTradeMoneyDifference({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ExpenditureTrades(),
          ReveneTrades(),
          VirtualSavings(),
        ],
      ),
    );
  }
}
