import 'package:flutter/material.dart';
import 'package:flutter_virtuality_saving_app/presentation/create_trade/widget/trade_create_card/trade_create_card.dart';
import 'package:flutter_virtuality_saving_app/presentation/create_trade/widget/trade_memo_text_field/trade_memo_text_field.dart';
import 'package:flutter_virtuality_saving_app/presentation/create_trade/widget/trade_money_text_field/trade_money_text_field.dart';
import 'package:flutter_virtuality_saving_app/presentation/create_trade/widget/trade_name_text_field/trade_name_text_field.dart';
import 'package:flutter_virtuality_saving_app/presentation/create_trade/widget/trade_select_date/trade_select_date.dart';
import 'package:flutter_virtuality_saving_app/presentation/create_trade/widget/trade_switing_buton/trade_switching_button.dart';
import 'package:flutter_virtuality_saving_app/presentation/edit_trade/widget/trade_delete_button/trade_delete_button.dart';
import 'package:flutter_virtuality_saving_app/presentation/edit_trade/widget/trade_edit_button/trade_edit_button.dart';

//Trade要素をタップした際に表示する【編集、保存、削除】のための画面
class EditTradePage extends StatelessWidget {
  const EditTradePage({Key? key, required this.day}) : super(key: key);
  final DateTime day;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: Container(
            padding: EdgeInsets.only(left: 5, top: 5),
            child: Icon(
              Icons.expand_more,
              color: Colors.black,
              size: 40,
            ),
          ),
        ),
        title: TradeSwitingButton(),
        toolbarHeight: 70,
        backgroundColor: Colors.grey[100],
      ),
      backgroundColor: Colors.grey[200],
      body: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // TradeNameTextField(),
                // TradeMoneyTextField(),
                // TradeMemoTextField(),
                // TradeSelectDateField(day: day),
                SizedBox(height: 30),
                TradeCreateCard(day: day),
                SizedBox(height: 20),
                TradeEditButton(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: TradeDeleteButton(),
    );
  }
}
