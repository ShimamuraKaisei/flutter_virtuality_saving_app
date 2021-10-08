import 'package:flutter_virtuality_saving_app/domain/entity/trade/trade.dart';

//インターフェース部分
abstract class ITradeSqflite {
  Future<void> add(Trade trade);
  Future<void> delete(int id);
}
