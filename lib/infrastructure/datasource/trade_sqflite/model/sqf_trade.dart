//DataSourceはEntitiyではなくModelを返す
//MpdelはEntityを拡張した子クラス

import 'package:flutter_virtuality_saving_app/domain/entity/trade/trade.dart';
import 'package:intl/intl.dart';

class SqfTrade {
  //Trade Classを継承しているわけではない
  //⏬テーブル作成時に使用
  static const keyId = 'id';
  static const keyTradeName = 'tradeName';
  static const keyAmountOfMoney = 'amountOfMoney';
  static const keyJudgement = 'judgement';
  static const keyMemo = 'memo';
  static const keyTradeDay = 'tradeDay';

  final String id;
  final String tradeName;
  final int amountOfMoney;
  final int judgement;
  final String memo;
  final String tradeDay;

  const SqfTrade({required this.id, required this.tradeName, required this.amountOfMoney, required this.judgement, required this.memo, required this.tradeDay});

  //⏬検索用の関数で使用
  factory SqfTrade.fromMap(Map<String, dynamic> map) {
    return SqfTrade(
      id: map[keyId],
      tradeName: map[keyTradeName],
      amountOfMoney: map[keyAmountOfMoney],
      judgement: map[keyJudgement],
      memo: map[keyMemo],
      tradeDay: map[keyTradeDay],
    );
  }
  //⏬型戻し
  Trade toEntity() {
    return Trade(
      id: id,
      tradeName: tradeName,
      amountOfMoney: amountOfMoney,
      judgement: judgement,
      memo: memo,
      tradeDay: DateFormat('yyyy年M月d日').parseStrict(tradeDay),
    );
  }

  //⏬SQLite使い方サイトに出てくる toMap(){~}の部分⏩データベース操作の関数内で使用
  static Map<String, dynamic> convertToMap(Trade trade) {
    return {
      keyId: trade.id,
      keyTradeName: trade.tradeName,
      keyAmountOfMoney: trade.amountOfMoney,
      keyJudgement: trade.judgement,
      keyMemo: trade.memo,
      keyTradeDay: trade.tradeDay,
    };
  }
}
