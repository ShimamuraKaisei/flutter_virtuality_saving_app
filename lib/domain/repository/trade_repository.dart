import 'dart:ffi';
import 'package:flutter_virtuality_saving_app/domain/entity/trade/trade.dart';

abstract class TradeRepository {
  Future<Trade> find(String id);
  Future<void> add(Trade trade);
  Future<void> delete(String id);
}
