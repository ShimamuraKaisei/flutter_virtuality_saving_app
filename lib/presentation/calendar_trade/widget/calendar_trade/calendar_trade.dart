import 'package:flutter/material.dart';
import 'package:flutter_virtuality_saving_app/presentation/calendar_trade/widget/calendar_trade/clendar_trade_controller.dart';
import 'package:flutter_virtuality_saving_app/presentation/create_trade/create_trade_page.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_virtuality_saving_app/interactor/trade/trade_interactor_provider.dart';

class CalendarTrade extends HookWidget {
  const CalendarTrade({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _selectedDay = useProvider(calendarTradeController).selectedDay;
    final tradeInteractor = useProvider(tradeInteractrorProvider.notifier);
    return TableCalendar(
      locale: 'ja_JP',
      focusedDay: _selectedDay, //Stateクラスの方で現在日に初期化している
      firstDay: DateTime.utc(2000, 1, 1),
      lastDay: DateTime.utc(2200, 12, 31),
      headerStyle: HeaderStyle(
        titleTextStyle: TextStyle(fontSize: 25),
        formatButtonVisible: false, //フォーマット変更ボタンの非表示
        titleCentered: true,
        decoration: BoxDecoration(
          color: Colors.blue,
        ),
        headerPadding: EdgeInsets.all(10),
      ),
      daysOfWeekHeight: 18, //曜日の文字の下部分が見切れるため
      rowHeight: 38, //カレンダー縦の余白
      selectedDayPredicate: (day) {
        //どの日が現在選択されているか
        return isSameDay(_selectedDay, day);
      },
      onDaySelected: (selectedDay, focuseDay) {
        if (!isSameDay(_selectedDay, selectedDay)) {
          context.read(calendarTradeController.notifier).getCurrentDate(selectedDay);
          showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(20),
              ),
            ),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            builder: (BuildContext context) {
              return Container(
                height: 590,
                child: TradeCreatePage(day: selectedDay),
              );
            },
          );
        }
      },
      onPageChanged: (day) {
        tradeInteractor.getTradeAll(day); //表示している月のリストを取得
      },
    );
  }
}
