import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_virtuality_saving_app/interactor/trade/trade_interactor_provider.dart';
import 'package:intl/intl.dart';

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
          itemBuilder: (context, int i) {
            return Container(
              child: Column(
                children: [
                  if (i == 0)
                    Column(
                      children: [
                        Card(
                          child: ListTile(
                            title: Text(DateFormat('yyyy年M月d日').format(data.currentMonthTrade[i].tradeDay!)),
                          ),
                        ),
                        ListTile(
                          title: Text(data.currentMonthTrade[i].tradeName!),
                        ),
                      ],
                    )
                  else if (i > 0 && data.currentMonthTrade[i].tradeDay == data.currentMonthTrade[i - 1].tradeDay)
                    ListTile(
                      title: Text(data.currentMonthTrade[i].tradeName!),
                    )
                  else if (i > 0 && data.currentMonthTrade[i].tradeDay != data.currentMonthTrade[i - 1].tradeDay)
                    Column(
                      children: [
                        Card(
                          child: ListTile(
                            title: Text(DateFormat('yyyy年M月d日').format(data.currentMonthTrade[i].tradeDay!)),
                          ),
                        ),
                        ListTile(
                          title: Text(data.currentMonthTrade[i].tradeName!),
                        )
                      ],
                    )
                  else
                    ListTile(
                      title: Text(data.currentMonthTrade[i].tradeName!),
                    )
                ],
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
