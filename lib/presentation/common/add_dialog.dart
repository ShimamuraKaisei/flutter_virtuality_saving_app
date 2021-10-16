import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddAlertDialog extends StatelessWidget {
  const AddAlertDialog({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CupertinoAlertDialog(
        title: Text('確認'),
        content: Text('正しく値を入力してください'),
        actions: [
          CupertinoDialogAction(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text("OK"),
          ),
        ],
      ),
    );
  }
}
