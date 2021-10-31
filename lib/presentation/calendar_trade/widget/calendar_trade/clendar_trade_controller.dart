import 'package:flutter_virtuality_saving_app/presentation/calendar_trade/widget/calendar_trade_state.dart';
import 'package:flutter_virtuality_saving_app/presentation/screen/widget/bottom_navigation_bar/screen_bottom_navigation_bar_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:state_notifier/state_notifier.dart';

final calendarTradeController =
    StateNotifierProvider<CalendarTradeController, CalendarTradeState>(
        (ref) => CalendarTradeController());

class CalendarTradeController extends StateNotifier<CalendarTradeState> {
  CalendarTradeController()
      : super(CalendarTradeState(selectedDay: DateTime.now())); //今日の日付で初期化
  void getCurrentDate(DateTime dateIndex) {
    state = CalendarTradeState(selectedDay: dateIndex);
  }
}

class BottomNavigationController
    extends StateNotifier<ScreenBottomNavigationBarState> {
  BottomNavigationController()
      : super(ScreenBottomNavigationBarState(indexState: 0)); //0で初期化
  void getCurrentIndex(int index) {
    state = ScreenBottomNavigationBarState(indexState: index);
  }
}
