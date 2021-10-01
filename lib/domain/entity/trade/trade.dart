//①取引の名前②金額③判定④取引日⑤メモ⑦id
class Trade {
  int? id;
  String? tradeName;
  int? amountOfMoney;
  int? judgement; //支出か収入かを判断する真偽値（0 or 1）
  String? memo;
  //取引日
  Trade({this.id, this.tradeName, this.amountOfMoney, this.judgement});
}
