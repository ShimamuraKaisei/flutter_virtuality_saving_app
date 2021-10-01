import 'package:flutter/material.dart';

//アプリ内設定画面
class AppSettingPage extends StatelessWidget {
  const AppSettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text('アプリ内設定画面'),
        ),
      ),
    );
  }
}
