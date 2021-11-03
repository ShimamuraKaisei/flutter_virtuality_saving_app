import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_virtuality_saving_app/interactor/trade/trade_interactor_provider.dart';

class VirtualSavings extends HookWidget {
  const VirtualSavings({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tradeInteractorData = useProvider(tradeInteractrorProvider);
    return Container(
      child: Column(
        children: [
          Text("仮想貯金額"),
          Container(
            // TODO: ⏬表示されている月の収支額を表示するように修正
            child: tradeInteractorData.when(
              data: (data) {
                try {
                  final sumRevene = data.reveneTrade
                      .map((trade) => trade.amountOfMoney)
                      .reduce((a, b) => a! + b!);
                  final sumExpenditure = data.expenditureTrade
                      .map((trade) => trade.amountOfMoney)
                      .reduce((a, b) => a! + b!);
                  final balance = sumRevene! - sumExpenditure!;
                  return Text(balance.toString() + "円");
                } catch (e) {
                  return Text("0円");
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
