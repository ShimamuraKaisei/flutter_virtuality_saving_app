import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'app.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  //⏬カレンダーを日本語にするために日付のフォーマットを初期化
  initializeDateFormatting().then(
    (_) => runApp(
      ProviderScope(
        child: MyApp(),
      ),
    ),
  );
}
