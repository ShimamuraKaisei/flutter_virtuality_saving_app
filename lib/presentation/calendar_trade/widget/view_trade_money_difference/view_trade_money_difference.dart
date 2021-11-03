import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_virtuality_saving_app/presentation/calendar_trade/widget/view_trade_money_difference/widget/expenditure_trades.dart';
import 'package:flutter_virtuality_saving_app/presentation/calendar_trade/widget/view_trade_money_difference/widget/revene_trades.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_virtuality_saving_app/interactor/trade/trade_interactor_provider.dart';

class ViewTradeMoneyDifference extends HookWidget {
  const ViewTradeMoneyDifference({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final List expenditureTrades;
    final List reveneTrades;
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          ExpenditureTrades(),
          ReveneTrades(),
          Container(
            child: Column(
              children: [
                Text("架空貯金額"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
