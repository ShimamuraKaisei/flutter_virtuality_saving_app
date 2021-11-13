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
    return Container();
  }
}
