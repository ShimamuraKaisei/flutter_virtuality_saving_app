import 'package:flutter_virtuality_saving_app/domain/entity/trade/trade.dart';
import 'package:flutter_virtuality_saving_app/domain/repository/i_trade_repository.dart';
import 'package:flutter_virtuality_saving_app/interactor/trade/trade_interactor_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TradeInteractor extends StateNotifier<AsyncValue<TradeInteractorState>> {
  TradeInteractor({required ITradeRepository repository})
      : _repository = repository,
        super(const AsyncLoading()) {
    getTradeAll(DateTime.now());
  }
  final ITradeRepository _repository;

  Future<void> addTrade({
    required String id,
    required String name,
    required String memo,
    required int money,
    required int judgement,
    required DateTime tradeDay,
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
    getTradeAll(DateTime.now()); //【 追加した後にリスト内を更新 】⏩後で修正
  }

  Future<void> deleteTrade({required String id}) async {
    await _repository.delete(id);
    getTradeAll(DateTime.now()); //【 データを消した後にリスト内を更新 】
  }

  Future<void> getTradeAll(DateTime selectedday) async {
    final trades = await _repository.getTradeAll();
    final expenditureTrades = await _repository.getExpenditureTrade();
    final reveneTrades = await _repository.getReveneTrade();
    final currentMonthTrades = await _repository.getCurrentMonthTrade(selectedday);
    final currentMonthExpenditureTrades = await _repository.getCurrentMonthExpenditureTrade(selectedday);
    final currentMonthReveneTrades = await _repository.getCurrentMonthReveneTrade(selectedday);
    final currentMonthDayTrades = await _repository.getCurrentMonthDayTrade(selectedday);
    //日付による昇順（日付が古い方が上に来る）
    trades.sort((a, b) => a.tradeDay!.compareTo(b.tradeDay!));
    currentMonthTrades.sort((a, b) => a.tradeDay!.compareTo(b.tradeDay!));

    state = AsyncData(
      TradeInteractorState(
        repository: _repository,
        trades: trades,
        expenditureTrade: expenditureTrades,
        reveneTrade: reveneTrades,
        currentMonghReveneTrade: currentMonthReveneTrades,
        currentMonthExpenditureTrade: currentMonthExpenditureTrades,
        currentMonthTrade: currentMonthTrades,
        currentMonthDayTrade: currentMonthDayTrades,
      ),
    );
  }
  //①アップデート関数
}
