import 'package:flutter_virtuality_saving_app/domain/entity/trade/trade.dart';

abstract class ITradeRepository {
  Future<void> add(Trade trade);
  Future<void> delete(int id);
  Future<List<Trade>> getTradeAll();
}
