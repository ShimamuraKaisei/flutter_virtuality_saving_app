import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_virtuality_saving_app/interactor/trade/trade_interactor_provider.dart';

class ExpenditureTrades extends HookWidget {
  const ExpenditureTrades({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final tradeInteractorData = useProvider(tradeInteractrorProvider);
    int sum;
    return Container(
      child: Column(
        children: [
          Text("支出"),
          Container(
            child: tradeInteractorData.when(
              data: (data) {
                try {
                  sum = data.currentMonthExpenditureTrade.map((trade) => trade.amountOfMoney).reduce((a, b) => a! + b!)!;
                  return Text(
                    sum.toString() + "円",
                    style: TextStyle(color: Colors.redAccent),
                  );
                } catch (e) {
                  sum = 0;
                  return Text(
                    sum.toString() + "円",
                    style: TextStyle(color: Colors.redAccent),
                  );
                }
              },
              loading: () {
                const Center(child: CircularProgressIndicator());
              },
              error: (error, stackTrace) => Text("エラー"),
            ),
          )
        ],
      ),
    );
  }
}
