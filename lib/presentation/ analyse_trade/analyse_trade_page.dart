import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_virtuality_saving_app/interactor/trade/trade_interactor_provider.dart';

//データグラフ画面
//SQLiteからのデータ取得ができるかリスト表示で確認

class AnalyseTradePage extends HookWidget {
  const AnalyseTradePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final tradeInteractorData = useProvider(tradeInteractrorProvider);
    final tradeInterActor = useProvider(tradeInteractrorProvider.notifier);
    return Scaffold(
      body: tradeInteractorData.when(
        data: (data) => ListView.builder(
          itemCount: data.trades.length,
          itemBuilder: (context, int index) {
            return Card(
              child: ListTile(
                title: Text(data.trades[index].tradeName!),
                onTap: () =>
                    tradeInterActor.deleteTrade(id: data.trades[index].id!),
              ),
            );
          },
        ),
        loading: () => Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stackTrace) => Text("データの取得に失敗しました"),
      ),
    );
  }
}
