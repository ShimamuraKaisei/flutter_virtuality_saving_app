import 'package:flutter_virtuality_saving_app/domain/entity/trade/trade.dart';

abstract class ITradeRepository {
  Future<void> add(Trade trade);
  Future<void> delete(String id);
  Future<List<Trade>> getTradeAll();
  Future<List<Trade>> getCurrentMonthTrade(DateTime day);
  Future<List<Trade>> getReveneTrade();
  Future<List<Trade>> getCurrentMonthReveneTrade(DateTime day);
  Future<List<Trade>> getExpenditureTrade();
  Future<List<Trade>> getCurrentMonthExpenditureTrade(DateTime day);
}
