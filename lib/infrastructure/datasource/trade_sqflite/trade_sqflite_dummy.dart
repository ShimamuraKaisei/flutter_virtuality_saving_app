//ダミー用でもインターフェースを実装する
//メモリー上にmapを用意しておく
import 'package:flutter_virtuality_saving_app/domain/entity/trade/trade.dart';
import 'package:flutter_virtuality_saving_app/infrastructure/datasource/trade_sqflite/i_trade_sqflite.dart';
import 'package:flutter_virtuality_saving_app/infrastructure/datasource/trade_sqflite/model/sqf_trade.dart';

class TradeSqfliteDummy implements ITradeSqflite {
  @override
  Future<void> add(Trade trade) {
    // TODO: implement add
    throw UnimplementedError();
  }

  @override
  Future<void> delete(String id) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<List<SqfTrade>> getTradeAll() {
    // TODO: implement getTradeAll
    throw UnimplementedError();
  }

  @override
  Future<List<SqfTrade>> getExpenditureTradeAll() {
    // TODO: implement getExpenditureTradeAll
    throw UnimplementedError();
  }

  @override
  Future<List<SqfTrade>> getRevenueTradeAll() {
    // TODO: implement getRevenueTradeAll
    throw UnimplementedError();
  }
}

//インスタンス化したデータを入れるリスト