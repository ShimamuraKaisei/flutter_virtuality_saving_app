import 'package:flutter/material.dart';
import 'package:flutter_virtuality_saving_app/presentation/create_trade/widget/trade_memo_text_field/trade_memo_text_field.dart';
import 'package:flutter_virtuality_saving_app/presentation/create_trade/widget/trade_money_text_field/trade_money_text_field.dart';
import 'package:flutter_virtuality_saving_app/presentation/create_trade/widget/trade_name_text_field/trade_name_text_field.dart';
import 'package:flutter_virtuality_saving_app/presentation/create_trade/widget/trade_create_button/trade_create_button.dart';
import 'package:flutter_virtuality_saving_app/presentation/create_trade/widget/trade_select_date/trade_select_date.dart';
import 'package:flutter_virtuality_saving_app/presentation/create_trade/widget/trade_switing_buton/trade_switching_button.dart';

//取引（貯金 or 支出 ）追加画面
class TradeCreatePage extends StatelessWidget {
  const TradeCreatePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TradeSwitingButton(),
      ),
      backgroundColor: Colors.grey[200],
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TradeNameTextField(),
              TradeMoneyTextField(),
              TradeMemoTextField(),
              TradeSelectDateField(),
              TradeCreateButton(),
            ],
          ),
        ),
      ),
    );
  }
}
