import 'package:flutter/material.dart';
import 'package:flutter_virtuality_saving_app/presentation/%20analyse_trade/analyse_trade_page.dart';
import 'package:flutter_virtuality_saving_app/presentation/app_setting/app_setting_page.dart';
import 'package:flutter_virtuality_saving_app/presentation/calendar_trade/calendar_trade_page.dart';
import 'package:flutter_virtuality_saving_app/presentation/create_trade/create_trade_page.dart';
import 'package:flutter_virtuality_saving_app/presentation/screen/widget/bottom_navigation_bar/screen_bottom_navigation_bar.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_virtuality_saving_app/presentation/screen/widget/bottom_navigation_bar/screen_bottom_navigation_bar_controller.dart';
import 'package:flutter_virtuality_saving_app/presentation/create_trade/widget/trade_select_date/trade_select_date_controller.dart';

//bottomNavigationBarの選択によって各ページを表示する画面
class ScreenPage extends HookWidget {
  const ScreenPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final selectedDate = useProvider(tradeSelectController).selectedDate;
    final _screens = [
      //要素が書き換えられてはいけないので_をつける
      TradeCreatePage(day: selectedDate!),
      AnalyseTradePage(),
      CalendarTradePage(),
      AppSettingPage(),
    ];
    final indexNav = useProvider(bottomNavigationController);
    return Scaffold(
      body: _screens[indexNav.indexState],
      bottomNavigationBar: ScreenBottomNavigationBar(),
    );
  }
}
