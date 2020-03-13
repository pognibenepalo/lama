import 'package:flutter/material.dart';
import 'package:lama_frontend/app-theme.dart';

class DateItem extends StatelessWidget {
  final String date;
  DateItem(this.date);
  @override
  Widget build(BuildContext build) {
    String formatedDate;
    if (date.indexOf('.') > 0) {
      formatedDate = date.substring(0, date.indexOf('.') + 1);
    } else {
      formatedDate = date;
    }
    return Container(
      key: Key(date),
      padding: EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Text(
        formatedDate,
        key: Key('dateItem0'),
        style: TextStyle(
          color: AppTheme.mainColor,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.left,
      ),
    );
  }
}
