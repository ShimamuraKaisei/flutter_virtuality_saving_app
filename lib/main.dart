import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'app.dart';

void main() {
  //⏬カレンダーを日本語にするために日付のフォーマットを初期化
  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}
