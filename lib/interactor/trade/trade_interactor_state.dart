import 'package:flutter_virtuality_saving_app/domain/entity/trade/trade.dart';
import 'package:flutter_virtuality_saving_app/domain/repository/i_trade_repository.dart';

class TradeInteractorState {
  ITradeRepository repository;

  List<Trade> trades;
  List<Trade> expenditureTrade; //支出の全データ
  List<Trade> reveneTrade; //収支の全データ

  TradeInteractorState({
    required this.repository,
    required this.trades,
    required this.expenditureTrade,
    required this.reveneTrade,
  });
}
