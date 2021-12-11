import 'package:flutter/material.dart';
import 'package:flutter_virtuality_saving_app/presentation/create_trade/widget/trade_create_card/trade_create_card.dart';
import 'package:flutter_virtuality_saving_app/presentation/create_trade/widget/trade_create_button/trade_create_button.dart';
import 'package:flutter_virtuality_saving_app/presentation/create_trade/widget/trade_switing_buton/trade_switching_button.dart';
// import 'package:keyboard_actions/keyboard_actions.dart';

//取引（貯金 or 支出 ）追加画面
class TradeCreatePage extends StatelessWidget {
  const TradeCreatePage({Key? key, required this.day}) : super(key: key);
  final DateTime day;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TradeSwitingButton(),
      ),
      backgroundColor: Colors.grey[200],
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 30),
                TradeCreateCard(day: day),
                SizedBox(height: 20),
                TradeCreateButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
