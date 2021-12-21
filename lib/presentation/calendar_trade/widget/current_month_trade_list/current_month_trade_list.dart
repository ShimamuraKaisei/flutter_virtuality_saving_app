import 'package:flutter/material.dart';
import 'package:flutter_virtuality_saving_app/presentation/calendar_trade/widget/current_month_trade_list/widget/current_month_trade_list_controller.dart';
import 'package:flutter_virtuality_saving_app/presentation/create_trade/widget/trade_memo_text_field/trade_memo_text_field_controller.dart';
import 'package:flutter_virtuality_saving_app/presentation/create_trade/widget/trade_money_text_field/trade_money_text_field_controller.dart';
import 'package:flutter_virtuality_saving_app/presentation/create_trade/widget/trade_select_date/trade_select_date_controller.dart';
import 'package:flutter_virtuality_saving_app/presentation/create_trade/widget/trade_switing_buton/trade_switching_button_controller.dart';
import 'package:flutter_virtuality_saving_app/presentation/edit_trade/edit_trade_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_virtuality_saving_app/interactor/trade/trade_interactor_provider.dart';
import 'package:intl/intl.dart';
import 'package:flutter_virtuality_saving_app/presentation/create_trade/widget/trade_name_text_field/trade_name_text_field_controller.dart';

class CurrentMonthTradeList extends HookWidget {
  const CurrentMonthTradeList({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final tradeInteractorData = useProvider(tradeInteractrorProvider);
    final tradeNameTextEditingController = useProvider(tradeNameTextFieldController).textEdtingController;
    final tradeAmountMoneyController = useProvider(tradeAmountMoneyTextFieldController).textEdtingController;
    final tradeMemoController = useProvider(tradeMemoTextFieldController).textEdtingController;
    final tradeSwitchStateController = useProvider(tradeSwitingButtonController);
    final tradeInteractor = useProvider(tradeInteractrorProvider.notifier);
    final selectedDayController = useProvider(tradeSelectController.notifier);
    final idController = useProvider(tradeIdController.notifier);
    final tradeDateController = useProvider(tradeSelectController);
    return Expanded(
      child: tradeInteractorData.when(
        data: (data) => ListView.builder(
          itemCount: data.currentMonthTrade.length,
          itemBuilder: (context, int i) {
            return Container(
              child: Column(
                children: [
                  if (i == 0)
                    Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            border: const Border(
                              top: BorderSide(color: Colors.black12),
                            ),
                          ),
                          child: Container(
                            padding: EdgeInsets.only(left: 10, top: 2),
                            child: Text(
                              DateFormat('yyyy年M月d日').format(data.currentMonthTrade[i].tradeDay!),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            tradeNameTextEditingController.text = data.currentMonthTrade[i].tradeName!;
                            tradeAmountMoneyController.text = data.currentMonthTrade[i].amountOfMoney!.toString();
                            tradeMemoController.text = data.currentMonthTrade[i].memo!;
                            tradeSwitchStateController.indexState = data.currentMonthTrade[i].judgement!;
                            idController.getTradeId(data.currentMonthTrade[i].id!);
                            context.read(tradeSelectController.notifier).selectDateOnTap(data.currentMonthTrade[i].tradeDay!);

                            showModalBottomSheet(
                              enableDrag: false,
                              isScrollControlled: true,
                              context: context,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              builder: (BuildContext context) {
                                return Container(
                                  height: 700,
                                  child: EditTradePage(day: tradeDateController.selectedDate!),
                                );
                              },
                            ).whenComplete(
                              //ModalBottomSheet()を{}内を実行
                              () {
                                tradeNameTextEditingController.text = "";
                                tradeAmountMoneyController.text = "";
                                tradeMemoController.text = "";
                              },
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: const Border(
                                top: BorderSide(color: Colors.black12),
                              ),
                            ),
                            child: ListTile(
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(data.currentMonthTrade[i].tradeName!),
                                  Text(data.currentMonthTrade[i].amountOfMoney.toString() + "円"),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  else if (i > 0 && data.currentMonthTrade[i].tradeDay == data.currentMonthTrade[i - 1].tradeDay)
                    InkWell(
                      onTap: () {
                        tradeNameTextEditingController.text = data.currentMonthTrade[i].tradeName!;
                        tradeAmountMoneyController.text = data.currentMonthTrade[i].amountOfMoney!.toString();
                        tradeMemoController.text = data.currentMonthTrade[i].memo!;
                        tradeSwitchStateController.indexState = data.currentMonthTrade[i].judgement!;
                        idController.getTradeId(data.currentMonthTrade[i].id!);

                        selectedDayController.selectDateOnTap(data.currentMonthTrade[i].tradeDay!);
                        showModalBottomSheet(
                          enableDrag: false,
                          isScrollControlled: true,
                          context: context,
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          builder: (BuildContext context) {
                            return Container(
                              height: 700,
                              child: EditTradePage(day: tradeDateController.selectedDate!),
                            );
                          },
                        ).whenComplete(
                          //ModalBottomSheet()を{}内を実行
                          () {
                            tradeNameTextEditingController.text = "";
                            tradeAmountMoneyController.text = "";
                            tradeMemoController.text = "";
                          },
                        );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                          border: const Border(top: BorderSide(color: Colors.black12)),
                        ),
                        child: ListTile(
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(data.currentMonthTrade[i].tradeName!),
                              Text(data.currentMonthTrade[i].amountOfMoney.toString() + "円"),
                            ],
                          ),
                        ),
                      ),
                    )
                  else if (i > 0 && data.currentMonthTrade[i].tradeDay != data.currentMonthTrade[i - 1].tradeDay)
                    Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 30,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            border: const Border(
                              top: BorderSide(color: Colors.black12),
                            ),
                          ),
                          child: Container(
                            padding: EdgeInsets.only(left: 10, top: 2),
                            child: Text(
                              DateFormat('yyyy年M月d日').format(data.currentMonthTrade[i].tradeDay!),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            tradeNameTextEditingController.text = data.currentMonthTrade[i].tradeName!;
                            tradeAmountMoneyController.text = data.currentMonthTrade[i].amountOfMoney!.toString();
                            tradeMemoController.text = data.currentMonthTrade[i].memo!;
                            tradeSwitchStateController.indexState = data.currentMonthTrade[i].judgement!;
                            idController.getTradeId(data.currentMonthTrade[i].id!);
                            selectedDayController.selectDateOnTap(data.currentMonthTrade[i].tradeDay!);
                            showModalBottomSheet(
                              enableDrag: false,
                              isScrollControlled: true,
                              context: context,
                              clipBehavior: Clip.antiAliasWithSaveLayer,
                              builder: (BuildContext context) {
                                return Container(
                                  height: 700,
                                  child: EditTradePage(day: tradeDateController.selectedDate!),
                                );
                              },
                            ).whenComplete(
                              //ModalBottomSheet()を{}内を実行
                              () {
                                tradeNameTextEditingController.text = "";
                                tradeAmountMoneyController.text = "";
                                tradeMemoController.text = "";
                              },
                            );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              border: const Border(
                                top: BorderSide(color: Colors.black12),
                              ),
                            ),
                            child: ListTile(
                              title: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(data.currentMonthTrade[i].tradeName!),
                                  Text(data.currentMonthTrade[i].amountOfMoney.toString() + "円"),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    )
                  else
                    ListTile(
                      title: Text(data.currentMonthTrade[i].tradeName!),
                    )
                ],
              ),
            );
          },
        ),
        loading: () => Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stackTrace) => Text("エラー"),
      ),
    );
  }
}
