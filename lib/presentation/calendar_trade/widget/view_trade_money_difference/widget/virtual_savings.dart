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
    int sumRevene = 0;
    int sumExpenditure = 0;
    int balance;
    return Container(
      child: Column(
        children: [
          Text("仮想貯金額"),
          Container(
            child: tradeInteractorData.when(
              data: (data) {
                try {
                  try {
                    sumRevene = data.currentMonghReveneTrade.map((trade) => trade.amountOfMoney).reduce((a, b) => a! + b!)!;
                  } catch (e) {
                    sumRevene = 0;
                  }
                  try {
                    sumExpenditure = data.currentMonthExpenditureTrade.map((trade) => trade.amountOfMoney).reduce((a, b) => a! + b!)!;
                  } catch (e) {
                    sumExpenditure = 0;
                  }
                  balance = sumRevene - sumExpenditure;
                  return Text(balance.toString() + "円");
                } catch (e) {
                  balance = sumRevene - sumExpenditure;
                  return Text(balance.toString() + "円");
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
