import 'package:flutter_virtuality_saving_app/domain/entity/trade/trade.dart';
import 'package:flutter_virtuality_saving_app/infrastructure/datasource/trade_sqflite/model/sqf_trade.dart';

//インターフェース部分
abstract class ITradeSqflite {
  Future<void> add(Trade trade);
  Future<void> delete(String id);
  Future<List<SqfTrade>> getTradeAll();
  Future<List<SqfTrade>> getCurrentMonthTrade(DateTime day);
  Future<List<SqfTrade>> getExpenditureTradeAll(); //支出の取引だけを取得
  Future<List<SqfTrade>> getCurrentMonthExpenditureTrade(DateTime day);
  Future<List<SqfTrade>> getRevenueTradeAll(); //収入の取引だけを取得
  Future<List<SqfTrade>> getCurrentMonthReveneTrade(DateTime day);
}
