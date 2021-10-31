import 'package:flutter/material.dart';
import 'package:flutter_virtuality_saving_app/presentation/calendar_trade/widget/calendar_trade.dart';
import 'package:flutter_virtuality_saving_app/presentation/calendar_trade/widget/clendar_trade_controller.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class CalendarTradePage extends StatelessWidget {
  const CalendarTradePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CalendarTrade();
  }
}
