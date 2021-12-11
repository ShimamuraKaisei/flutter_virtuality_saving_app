import 'package:flutter/material.dart';
import 'package:flutter_virtuality_saving_app/presentation/calendar_trade/widget/calendar_trade/clendar_trade_controller.dart';
import 'package:flutter_virtuality_saving_app/presentation/create_trade/create_trade_page.dart';
import 'package:flutter_virtuality_saving_app/presentation/create_trade/widget/trade_memo_text_field/trade_memo_text_field_controller.dart';
import 'package:flutter_virtuality_saving_app/presentation/create_trade/widget/trade_money_text_field/trade_money_text_field_controller.dart';
import 'package:flutter_virtuality_saving_app/presentation/create_trade/widget/trade_name_text_field/trade_name_text_field_controller.dart';
import 'package:flutter_virtuality_saving_app/presentation/create_trade/widget/trade_select_date/trade_select_date_controller.dart';
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
    final nameController = useProvider(tradeNameTextFieldController);
    final moneyController = useProvider(tradeAmountMoneyTextFieldController);
    final tradeMemoController = useProvider(tradeMemoTextFieldController);
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
      daysOfWeekHeight: 20, //曜日の文字の下部分が見切れるため
      daysOfWeekStyle: DaysOfWeekStyle(
        //曜日名ヘッダーのスタイル変更
        decoration: BoxDecoration(
          color: Colors.grey[350],
        ),
        weekdayStyle: TextStyle(color: Colors.black),
        weekendStyle: TextStyle(color: Colors.red),
      ),
      rowHeight: 38, //カレンダー縦の余白
      calendarStyle: CalendarStyle(
        tableBorder: TableBorder.all(),
        selectedDecoration: BoxDecoration(color: Colors.amber[200]),
        selectedTextStyle: TextStyle(color: Colors.black),
        defaultDecoration: BoxDecoration(
          border: Border.all(color: Colors.black12),
        ),
        todayDecoration: BoxDecoration(
          border: Border.all(color: Colors.black12),
        ),
        outsideDecoration: BoxDecoration(
          border: Border.all(color: Colors.black12),
        ),
        weekendDecoration: BoxDecoration(
          border: Border.all(color: Colors.black12),
        ),
        todayTextStyle: TextStyle(color: Colors.black),
        cellMargin: EdgeInsets.zero,
      ),
      selectedDayPredicate: (day) {
        //どの日が現在選択されているか
        return isSameDay(_selectedDay, day);
      },
      onDaySelected: (selectedDay, focuseDay) {
        // if (!isSameDay(_selectedDay, selectedDay)) { //このままだと当日をタップしても関数が実行されない
        // context.read(calendarTradeController.notifier).getCurrentDate(selectedDay);//今の所使ってない
        //⏬
        context.read(tradeSelectController.notifier).selectDateOnTap(selectedDay);
        nameController.textEdtingController.text = "";
        moneyController.textEdtingController.text = "";
        tradeMemoController.textEdtingController.text = "";

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
              child: TradeCreatePage(day: _selectedDay),
            );
          },
        );
        // }
      },
      onPageChanged: (day) {
        tradeInteractor.getTradeAll(day); //表示している月のリストを取得
      },
    );
  }
}
