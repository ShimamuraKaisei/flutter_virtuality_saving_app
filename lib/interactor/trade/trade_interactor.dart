import 'package:flutter_virtuality_saving_app/domain/entity/trade/trade.dart';
import 'package:flutter_virtuality_saving_app/domain/repository/i_trade_repository.dart';
import 'package:flutter_virtuality_saving_app/interactor/trade/trade_interactor_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TradeInteractor extends StateNotifier<AsyncValue<TradeInteractorState>> {
  TradeInteractor({required ITradeRepository repository})
      : _repository = repository,
        super(const AsyncLoading()) {
    getTradeAll();
  }
  final ITradeRepository _repository;

  Future<void> addTrade({
    required String name,
    required String memo,
    required int money,
    required int judgement,
  }) async {
    final trade = Trade(
      tradeName: name,
      amountOfMoney: money,
      judgement: judgement,
      memo: memo,
    );
    await _repository.add(trade);
  }

  Future<void> deleteTrade({required int id}) async {
    await _repository.delete(id);
  }

  Future<void> getTradeAll() async {
    final trades = await _repository.getTradeAll();
    state = AsyncData(
        TradeInteractorState(repository: _repository, trades: trades));
  }
  //①アップデート関数
}
