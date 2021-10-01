import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
//取引内容入力後の確定ボタン

class TradeCreateButton extends StatelessWidget {
  const TradeCreateButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      child: Text('保存'),
      color: Colors.red,
      onPressed: () {},
    );
  }
}
