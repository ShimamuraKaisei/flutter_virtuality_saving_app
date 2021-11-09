import 'package:flutter_virtuality_saving_app/infrastructure/repository/trade/trade_repository_provider.dart';
import 'package:flutter_virtuality_saving_app/interactor/trade/trade_interactor.dart';
import 'package:flutter_virtuality_saving_app/interactor/trade/trade_interactor_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final tradeInteractrorProvider = StateNotifierProvider<TradeInteractor, AsyncValue<TradeInteractorState>>(
  (ref) => TradeInteractor(repository: ref.read(tradeRepositoryProvoder)),
);
