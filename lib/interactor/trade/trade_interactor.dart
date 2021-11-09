import 'package:flutter_virtuality_saving_app/domain/entity/trade/trade.dart';
import 'package:flutter_virtuality_saving_app/domain/repository/i_trade_repository.dart';
import 'package:flutter_virtuality_saving_app/interactor/trade/trade_interactor_state.dart';
import 'package:flutter_virtuality_saving_app/presentation/calendar_trade/widget/calendar_trade/calendar_trade_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_virtuality_saving_app/presentation/calendar_trade/widget/calendar_trade/clendar_trade_controller.dart';

class TradeInteractor extends StateNotifier<AsyncValue<TradeInteractorState>> {
  TradeInteractor({required ITradeRepository repository})
      : _repository = repository,
        super(const AsyncLoading()) {
    getTradeAll();
  }
  final ITradeRepository _repository;

  Future<void> addTrade({
    required String id,
    required String name,
    required String memo,
    required int money,
    required int judgement,
    required String tradeDay,
  }) async {
    final trade = Trade(
      id: id,
      tradeName: name,
      amountOfMoney: money,
      judgement: judgement,
      memo: memo,
      tradeDay: tradeDay,
    );
    await _repository.add(trade);
    getTradeAll(); //【 追加した後にリスト内を更新 】⏩後で修正
  }

  Future<void> deleteTrade({required String id}) async {
    await _repository.delete(id);
    getTradeAll(); //【 データを消した後にリスト内を更新 】
  }

  Future<void> getTradeAll() async {
    final trades = await _repository.getTradeAll();
    final expenditureTrades = await _repository.getExpenditureTrade();
    final reveneTrades = await _repository.getReveneTrade();
    // final currentMonthExpenditureTrades = await _repository.getCurrentMonthExpenditureTrade();
    // final currentMonthReveneTrades = await _repository.getCurrentMonthReveneTrade();
    // final currentMonthTrades = await _repository.getCurrentMonthTrade();
    state = AsyncData(TradeInteractorState(
      repository: _repository,
      trades: trades,
      expenditureTrade: expenditureTrades,
      reveneTrade: reveneTrades,
      currentMonghReveneTrade: [],
      currentMonthExpenditureTrade: [],
      currentMonthTrade: [],
    ));
  }
  //①アップデート関数
}
