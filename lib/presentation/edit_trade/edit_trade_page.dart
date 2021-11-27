import 'package:flutter/material.dart';
import 'package:flutter_virtuality_saving_app/presentation/create_trade/widget/trade_memo_text_field/trade_memo_text_field.dart';
import 'package:flutter_virtuality_saving_app/presentation/create_trade/widget/trade_money_text_field/trade_money_text_field.dart';
import 'package:flutter_virtuality_saving_app/presentation/create_trade/widget/trade_name_text_field/trade_name_text_field.dart';
import 'package:flutter_virtuality_saving_app/presentation/create_trade/widget/trade_select_date/trade_select_date.dart';
import 'package:flutter_virtuality_saving_app/presentation/create_trade/widget/trade_switing_buton/trade_switching_button.dart';
import 'package:flutter_virtuality_saving_app/presentation/edit_trade/widget/trade_edit_button/trade_edit_button.dart';

//Trade要素をタップした際に表示する【編集、保存、削除】のための画面
class EditTradePage extends StatelessWidget {
  const EditTradePage({Key? key, required this.day}) : super(key: key);
  final DateTime day;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TradeSwitingButton(),
        toolbarHeight: 70,
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
              TradeSelectDateField(day: day),
              TradeEditButton(),
            ],
          ),
        ),
      ),
    );
  }
}
