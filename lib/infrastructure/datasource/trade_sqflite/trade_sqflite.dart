import 'package:flutter_virtuality_saving_app/domain/entity/trade/trade.dart';
import 'package:flutter_virtuality_saving_app/infrastructure/datasource/trade_sqflite/i_trade_sqflite.dart';
import 'package:flutter_virtuality_saving_app/infrastructure/datasource/trade_sqflite/model/sqf_trade.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class TradeSqflite implements ITradeSqflite {
  //implementsすることで定義忘れがあるとエラー文がでる
  static const _tableName = 'trade';

  Future<Database> _getDatabase() async {
    final Future<Database> _database = openDatabase(
      join(await getDatabasesPath(), 'trade_database.db'),
      onCreate: (db, version) async {
        await db.execute(
          // テーブルの作成
          '''
          CREATE TABLE $_tableName (
            ${SqfTrade.keyId} INTEGER PRIMARY KEY AUTOINCREMENT,
            ${SqfTrade.keyTradeName} TEXT, 
            ${SqfTrade.keyAmountOfMoney} INTEGER, 
            ${SqfTrade.keyJudgement} INTEGER,
            ${SqfTrade.keyMemo} TEXT
          )
          ''',
        );
      },
      version: 1,
    );
    return _database;
  }

  @override
  Future<void> add(Trade trade) async {
    try {
      final Database db = await _getDatabase();
      final map = SqfTrade.convertToMap(trade);
      await db.insert(_tableName, map);
    } catch (e) {
      rethrow; //呼び出し元で例外を見れるようにする
    }
  }

  @override
  Future<void> delete(int id) async {
    try {
      final Database db = await _getDatabase();
      await db.delete(
        _tableName,
        where: "${SqfTrade.keyId}=?",
        whereArgs: [id],
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<SqfTrade>> getTradeAll() async {
    try {
      final Database db = await _getDatabase();
      final List<Map<String, dynamic>> maps = await db.query(_tableName);
      return List.generate(
          maps.length,
          (i) => SqfTrade(
                id: maps[i]['id'],
                tradeName: maps[i]['tradeName'],
                amountOfMoney: maps[i]['amountOfMoney'],
                judgement: maps[i]['judgement'],
                memo: maps[i]['memo'],
              ));
    } catch (e) {
      rethrow;
    }
  }
}
