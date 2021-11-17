import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_virtuality_saving_app/interactor/trade/trade_interactor_provider.dart';

class CurrentMonthTradeList extends HookWidget {
  const CurrentMonthTradeList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final tradeInteractorData = useProvider(tradeInteractrorProvider);
    final tradeInteractor = useProvider(tradeInteractrorProvider.notifier);
    return Expanded(
      child: tradeInteractorData.when(
        data: (data) => ListView.builder(
          itemCount: data.currentMonthTrade.length,
          itemBuilder: (context, int index) {
            return Container(
              child: Card(
                child: ListTile(
                  title: Text(data.currentMonthTrade[index].tradeName!),
                  onTap: () => tradeInteractor.deleteTrade(id: data.currentMonthTrade[index].id!),
                  subtitle: Text(data.currentMonthTrade[index].tradeDay!),
                ),
              ),
            );
          },
        ),
        loading: () => Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stackTrace) => Text("エラー"),
      ),
    );
  }
}
