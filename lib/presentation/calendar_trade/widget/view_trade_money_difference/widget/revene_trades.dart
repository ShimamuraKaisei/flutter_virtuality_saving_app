import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_virtuality_saving_app/domain/entity/trade/trade.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_virtuality_saving_app/interactor/trade/trade_interactor_provider.dart';

class ReveneTrades extends HookWidget {
  const ReveneTrades({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final tradeInteractorData = useProvider(tradeInteractrorProvider);
    final tradeInterActor = useProvider(tradeInteractrorProvider.notifier);
    List<Trade> expenditureTrades;
    return Container(
      child: Column(
        children: [
          Text("支出"),
        ],
      ),
    );
  }
}
