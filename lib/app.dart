import 'package:flutter/material.dart';
import 'package:flutter_virtuality_saving_app/presentation/screen/screen.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ScreenPage(),
    );
  }
}
