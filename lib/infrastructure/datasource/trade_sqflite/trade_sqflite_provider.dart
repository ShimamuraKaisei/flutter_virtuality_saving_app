import 'package:flutter_virtuality_saving_app/infrastructure/datasource/trade_sqflite/i_trade_sqflite.dart';
import 'package:flutter_virtuality_saving_app/infrastructure/datasource/trade_sqflite/trade_sqflite.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

//ローカル用データソース
final tradeSqfliteProvider = Provider<ITradeSqflite>((ref) => TradeSqflite());
