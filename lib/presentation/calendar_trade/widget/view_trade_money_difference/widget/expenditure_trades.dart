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
    return Container(
      child: Column(
        children: [
          Text("収支"),
          Container(
            child: tradeInteractorData.when(
              data: (data) {
                try {
                  final sum = data.expenditureTrade
                      .map((trade) => trade.amountOfMoney)
                      .reduce((a, b) => a! + b!);
                  return Text(sum.toString() + "円");
                } catch (e) {
                  return Text("0円");
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
