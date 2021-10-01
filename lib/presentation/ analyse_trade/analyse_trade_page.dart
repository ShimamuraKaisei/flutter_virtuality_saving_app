import 'package:flutter/material.dart';

//データグラフ画面
class AnalyseTradePage extends StatelessWidget {
  const AnalyseTradePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          child: Column(
            children: [
              Text("貯金データ画面"),
            ],
          ),
        ),
      ),
    );
  }
}
