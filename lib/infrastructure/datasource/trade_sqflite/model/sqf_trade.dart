//DataSourceはEntitiyではなくModelを返す
//MpdelはEntityを拡張した子クラス

import 'package:flutter_virtuality_saving_app/domain/entity/trade/trade.dart';

class SqfTrade {
  static const keyId = 'id';
  static const keyTradeName = 'tradeName';
  static const keyAmountOfMoney = 'amountOfMoney';
  static const keyJudgement = 'judgement';
  static const keyMemo = 'memo';

  final String id;
  final String tradeName;
  final int amountOfMoney;
  final int judgement;
  final String memo;

  const SqfTrade(
      {required this.id,
      required this.tradeName,
      required this.amountOfMoney,
      required this.judgement,
      required this.memo});
  //検索用の関数で使用
  factory SqfTrade.fromMap(Map<String, dynamic> map) {
    return SqfTrade(
      id: map[keyId],
      tradeName: map[keyTradeName],
      amountOfMoney: map[keyAmountOfMoney],
      judgement: map[keyJudgement],
      memo: map[keyMemo],
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
    };
  }
}
