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
      join(await getDatabasesPath(), 'trade_database5.db'),
      onCreate: (db, version) async {
        await db.execute(
          // テーブルの作成
          '''
          CREATE TABLE $_tableName (
            ${SqfTrade.keyId} TEXT,
            ${SqfTrade.keyTradeName} TEXT, 
            ${SqfTrade.keyAmountOfMoney} INTEGER, 
            ${SqfTrade.keyJudgement} INTEGER,
            ${SqfTrade.keyMemo} TEXT,
            ${SqfTrade.keyTradeDay} TEXT
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
  Future<void> delete(String id) async {
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
                tradeDay: maps[i]['tradeDay'],
              ));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<SqfTrade>> getExpenditureTradeAll() async {
    try {
      final Database db = await _getDatabase();
      final List<Map<String, dynamic>> maps = await db.query(_tableName, where: 'judgement =?', whereArgs: [1]);
      return List.generate(
          maps.length,
          (i) => SqfTrade(
                id: maps[i]['id'],
                tradeName: maps[i]['tradeName'],
                amountOfMoney: maps[i]['amountOfMoney'],
                judgement: maps[i]['judgement'],
                memo: maps[i]['memo'],
                tradeDay: maps[i]['tradeDay'],
              ));
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<SqfTrade>> getRevenueTradeAll() async {
    try {
      final Database db = await _getDatabase();
      final List<Map<String, dynamic>> maps = await db.query(_tableName, where: 'judgement =?', whereArgs: [0]);
      return List.generate(
        maps.length,
        (i) => SqfTrade(
          id: maps[i]['id'],
          tradeName: maps[i]['tradeName'],
          amountOfMoney: maps[i]['amountOfMoney'],
          judgement: maps[i]['judgement'],
          memo: maps[i]['memo'],
          tradeDay: maps[i]['tradeDay'],
        ),
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<SqfTrade>> getCurrentMonthExpenditureTrade(DateTime _selectedDay) async {
    try {
      String result = "${_selectedDay.year}年${_selectedDay.month}月";
      final Database db = await _getDatabase();
      final List<Map<String, dynamic>> maps = await db.rawQuery('SELECT * FROM $_tableName WHERE tradeDay LIKE ? AND judgement = 1', ['%$result%']);
      return List.generate(
        maps.length,
        (i) => SqfTrade(
          id: maps[i]['id'],
          tradeName: maps[i]['tradeName'],
          amountOfMoney: maps[i]['amountOfMoney'],
          judgement: maps[i]['judgement'],
          memo: maps[i]['memo'],
          tradeDay: maps[i]['tradeDay'],
        ),
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<SqfTrade>> getCurrentMonthReveneTrade(DateTime _selectedDay) async {
    try {
      String result = "${_selectedDay.year}年${_selectedDay.month}月";
      final Database db = await _getDatabase();
      final List<Map<String, dynamic>> maps = await db.rawQuery('SELECT * FROM $_tableName WHERE tradeDay LIKE ? AND judgement = 0', ['%$result%']);
      return List.generate(
        maps.length,
        (i) => SqfTrade(
          id: maps[i]['id'],
          tradeName: maps[i]['tradeName'],
          amountOfMoney: maps[i]['amountOfMoney'],
          judgement: maps[i]['judgement'],
          memo: maps[i]['memo'],
          tradeDay: maps[i]['tradeDay'],
        ),
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<SqfTrade>> getCurrentMonthTrade(DateTime _selectedDay) async {
    try {
      String result = "${_selectedDay.year}年${_selectedDay.month}月";
      final Database db = await _getDatabase();
      final List<Map<String, dynamic>> maps = await db.query(_tableName, where: 'tradeDay LIKE ?', whereArgs: ['%$result%']);
      return List.generate(
        maps.length,
        (i) => SqfTrade(
          id: maps[i]['id'],
          tradeName: maps[i]['tradeName'],
          amountOfMoney: maps[i]['amountOfMoney'],
          judgement: maps[i]['judgement'],
          memo: maps[i]['memo'],
          tradeDay: maps[i]['tradeDay'],
        ),
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<SqfTrade>> getCurrentMonthDayTrade(DateTime _selectedDay) async {
    try {
      String result = "${_selectedDay.year}年${_selectedDay.month}月${_selectedDay.day}";
      final Database db = await _getDatabase();
      final List<Map<String, dynamic>> maps = await db.query(_tableName, where: 'tradeDay LIKE ?', whereArgs: ['%$result%']);
      return List.generate(
        maps.length,
        (i) => SqfTrade(
          id: maps[i]['id'],
          tradeName: maps[i]['tradeName'],
          amountOfMoney: maps[i]['amountOfMoney'],
          judgement: maps[i]['judgement'],
          memo: maps[i]['memo'],
          tradeDay: maps[i]['tradeDay'],
        ),
      );
    } catch (e) {
      rethrow;
    }
  }
}
