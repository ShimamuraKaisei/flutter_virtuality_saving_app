import 'package:flutter_virtuality_saving_app/domain/entity/trade/trade.dart';
import 'package:flutter_virtuality_saving_app/domain/repository/i_trade_repository.dart';

class TradeInteractorState {
  ITradeRepository repository;
  List<Trade> trades;
  TradeInteractorState({required this.repository, required this.trades});
}
