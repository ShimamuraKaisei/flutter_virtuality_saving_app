import 'package:flutter_virtuality_saving_app/domain/entity/trade/trade.dart';
import 'package:flutter_virtuality_saving_app/domain/repository/i_trade_repository.dart';
import 'package:flutter_virtuality_saving_app/infrastructure/datasource/trade_sqflite/i_trade_sqflite.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_virtuality_saving_app/presentation/calendar_trade/widget/calendar_trade/clendar_trade_controller.dart';

class TradeRepositoryImpl implements ITradeRepository {
  final ITradeSqflite _sqf;
  TradeRepositoryImpl({
    required ITradeSqflite sqf,
  }) : _sqf = sqf;

  @override
  Future<void> add(Trade trade) async {
    try {
      await _sqf.add(trade);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<void> delete(String id) async {
    try {
      await _sqf.delete(id);
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Trade>> getTradeAll() async {
    try {
      final data = await _sqf.getTradeAll();
      return data.map((e) => e.toEntity()).toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Trade>> getExpenditureTrade() async {
    try {
      final data = await _sqf.getExpenditureTradeAll();
      return data.map((e) => e.toEntity()).toList();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<List<Trade>> getReveneTrade() async {
    try {
      final data = await _sqf.getRevenueTradeAll();
      return data.map((e) => e.toEntity()).toList();
    } catch (e) {
      rethrow;
    }
  }

  // @override
  // Future<List<Trade>> getCurrentMonthExpenditureTrade() async {
  //   try {
  //     final data = await _sqf.getCurrentMonthExpenditureTrade();
  //     return data.map((e) => e.toEntity()).toList();
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // @override
  // Future<List<Trade>> getCurrentMonthReveneTrade() async {
  //   try {
  //     final data = await _sqf.getCurrentMonthReveneTrade();
  //     return data.map((e) => e.toEntity()).toList();
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // @override
  // Future<List<Trade>> getCurrentMonthTrade() async {
  //   try {
  //     final data = await _sqf.getCurrentMonthTrade();
  //     return data.map((e) => e.toEntity()).toList();
  //   } catch (e) {
  //     rethrow;
  //   }
  // }
}
