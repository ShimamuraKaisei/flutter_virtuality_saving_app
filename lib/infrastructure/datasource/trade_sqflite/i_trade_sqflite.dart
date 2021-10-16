import 'package:flutter_virtuality_saving_app/domain/entity/trade/trade.dart';
import 'package:flutter_virtuality_saving_app/infrastructure/datasource/trade_sqflite/model/sqf_trade.dart';

//インターフェース部分
abstract class ITradeSqflite {
  Future<void> add(Trade trade);
  Future<void> delete(String id);
  Future<List<SqfTrade>> getTradeAll();
}
