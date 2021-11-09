import 'package:flutter_virtuality_saving_app/domain/repository/i_trade_repository.dart';
import 'package:flutter_virtuality_saving_app/infrastructure/repository/trade/trade_repository_impl.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_virtuality_saving_app/infrastructure/datasource/trade_sqflite/trade_sqflite_provider.dart';

final tradeRepositoryProvoder = Provider<ITradeRepository>((ref) => TradeRepositoryImpl(sqf: ref.read(tradeSqfliteProvider)));
