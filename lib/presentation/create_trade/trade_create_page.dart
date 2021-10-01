import 'package:flutter/material.dart';

//取引（貯金 or 支出 ）追加画面
class TradeCreatePage extends StatelessWidget {
  const TradeCreatePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            children: [
              Text("取引追加画面"),
            ],
          ),
        ),
      ),
    );
  }
}
