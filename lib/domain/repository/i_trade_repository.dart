import 'package:flutter_virtuality_saving_app/domain/entity/trade/trade.dart';

abstract class ITradeRepository {
  Future<void> add(Trade trade);
  Future<void> delete(String id);
  Future<List<Trade>> getTradeAll();
  Future<List<Trade>> getReveneTrade();
  Future<List<Trade>> getExpenditureTrade();
}
