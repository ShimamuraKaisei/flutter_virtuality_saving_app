import 'package:flutter/material.dart';
import 'package:flutter_virtuality_saving_app/presentation/common/date_field_card.dart';

class TradeSelectDateField extends StatelessWidget {
  final DateTime day;
  const TradeSelectDateField({Key? key, required this.day}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DateFieldCard(
      title: "日付",
      day: day,
    );
  }
}
