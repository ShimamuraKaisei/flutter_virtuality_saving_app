import 'package:flutter_virtuality_saving_app/domain/entity/trade/trade.dart';
import 'package:flutter_virtuality_saving_app/domain/repository/i_trade_repository.dart';
import 'package:flutter_virtuality_saving_app/infrastructure/datasource/trade_sqflite/i_trade_sqflite.dart';

class TradeRepositoryImpl implements ITradeRepository {
  final ITradeSqflite _sqf;
  TradeRepositoryImpl({
    required ITradeSqflite sqf,
  }) : _sqf = sqf;

  @override
  Future<void> add(Trade trade) async {
    try {
      await _sqf.add(trade);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> delete(int id) async {
    try {
      await _sqf.delete(id);
    } catch (e) {
      rethrow;
    }
  }
}
