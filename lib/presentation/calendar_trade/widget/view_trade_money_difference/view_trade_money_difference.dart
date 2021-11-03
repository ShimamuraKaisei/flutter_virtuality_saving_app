import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ViewTradeMoneyDifference extends HookWidget {
  const ViewTradeMoneyDifference({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            child: Column(
              children: [
                Text("収支"),
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                Text("支出"),
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                Text("架空貯金額"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
