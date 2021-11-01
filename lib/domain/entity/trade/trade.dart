//①取引の名前②金額③判定④取引日⑤メモ⑦id
class Trade {
  String? id; //SQLiteによる自動生成
  String? tradeName;
  int? amountOfMoney;
  int? judgement; //支出か収入かを判断する真偽値（0 or 1）
  String? memo;
  String? tradeDay;
  //取引日
  Trade(
      {required this.id,
      required this.tradeName,
      required this.amountOfMoney,
      required this.judgement,
      required this.memo,
      required this.tradeDay});
}
