import 'package:flutter/material.dart';
import 'dart:async';

import 'package:intl/intl.dart';


class DatePicker extends StatefulWidget {
  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime date = DateTime.now();

  Future _selectDate(BuildContext context) async {
    DateTime? picker = await showDatePicker(
        context: context,
        initialDate: date,
        firstDate: new DateTime(1900),
        lastDate: new DateTime.now());

    if (picker != null) {
      setState(() {
        date = picker;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _selectDate(context),
      child: Container(
        margin: const EdgeInsets.only(left: 32.0, right: 16.0),
        padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 24.0),
        decoration: BoxDecoration(
            color: const Color(0x3305756D),
            borderRadius: BorderRadius.circular(12.0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const Text(
              'BIRTHDAY',
              style: TextStyle(letterSpacing: 2.0, fontFamily: 'Montserrat'),
            ),
            Text(
           DateFormat('d MMM y').format(date),
              style: const TextStyle(
                  letterSpacing: 2.0,
                  color: Color(0xff353535),
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Montserrat'),
            )
          ],
        ),
      ),
    );
  }
}
