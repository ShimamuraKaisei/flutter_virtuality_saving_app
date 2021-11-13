import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_virtuality_saving_app/interactor/trade/trade_interactor_provider.dart';

class ReveneTrades extends HookWidget {
  const ReveneTrades({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tradeInteractorData = useProvider(tradeInteractrorProvider);
    int sum;
    return Container(
      child: Column(
        children: [
          Text("収支"),
          Container(
            // TODO: ⏬表示されている月の収支額を表示するように修正
            child: tradeInteractorData.when(
              data: (data) {
                try {
                  sum = data.reveneTrade.map((trade) => trade.amountOfMoney).reduce((a, b) => a! + b!)!;
                  return Text(sum.toString() + "円");
                } catch (e) {
                  sum = 0;
                  return Text(sum.toString() + "円");
                }
              },
              loading: () {
                const Center(child: CircularProgressIndicator());
              },
              error: (error, stackTrace) => Text("エラー"),
            ),
          ),
        ],
      ),
    );
  }
}
