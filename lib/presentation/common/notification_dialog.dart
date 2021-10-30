import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationAlertDialog extends StatelessWidget {
  final String title;
  const NotificationAlertDialog({Key? key, required this.title})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: CupertinoAlertDialog(
        title: Text('確認'),
        content: Text(title),
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
