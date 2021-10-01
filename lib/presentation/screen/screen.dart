import 'package:flutter/material.dart';
import 'package:flutter_virtuality_saving_app/presentation/%20analyse_trade/analyse_trade_page.dart';
import 'package:flutter_virtuality_saving_app/presentation/common/app_setting_page.dart';
import 'package:flutter_virtuality_saving_app/presentation/create_trade/trade_create_page.dart';
import 'package:flutter_virtuality_saving_app/presentation/screen/widget/screen_bottom_navigation_bar.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:state_notifier/state_notifier.dart';
import 'package:flutter_virtuality_saving_app/presentation/screen/widget/screen_bottom_navigation_bar_provider.dart';

//bottomNavigationBarの選択によって各ページを表示する画面
class ScreenPage extends HookWidget {
  const ScreenPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _screens = [
      TradeCreatePage(),
      AnalyseTradePage(),
      AppSettingPage(),
    ];
    final indexNav = useProvider(bottomNavigationProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('テスト'),
      ),
      body: _screens[indexNav],
      bottomNavigationBar: ScreenBottomNavigationBar(),
    );
  }
}
