import 'dart:io';

import 'package:currency_converter/models/currency/currency.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flag/flag.dart';
import 'package:intl/intl.dart';

class DateButton extends StatelessWidget {
  final double iconSize = 20;
  final Function(DateTime) onPressed;
  final DateTime? selectedDate;
  const DateButton({
    super.key,
    required this.onPressed,
    this.selectedDate,
  });

  @override
  Widget build(BuildContext context) {
    final DateTime dateToFormat = selectedDate ?? DateTime.now();
    final DateFormat formatter = DateFormat('dd-MM-yyyy');
    String formattedDate = formatter.format(dateToFormat);
    return OutlinedButton(
      onPressed: () async {
        if (Platform.isAndroid) {
          DateTime? selectedDate = await showDatePicker(
            context: context,
            firstDate: DateTime.now().subtract(const Duration(days: 356)),
            lastDate: DateTime.now(),
          );
          if (selectedDate != null) {
            onPressed(selectedDate);
          }
        }
        if (Platform.isIOS) {
          DateTime selectedDateTime = selectedDate ?? DateTime.now();
          await _showDialog(
            context,
            CupertinoDatePicker(
              initialDateTime: selectedDateTime.isAfter(
                      DateTime.now().subtract(const Duration(days: 356 * 10)))
                  ? selectedDate
                  : DateTime.now(),
              mode: CupertinoDatePickerMode.date,
              use24hFormat: true,
              showDayOfWeek: true,
              minimumDate:
                  DateTime.now().subtract(const Duration(days: 356 * 10)),
              maximumDate: DateTime.now(),
              onDateTimeChanged: (DateTime newDate) {
                selectedDateTime = newDate;
              },
            ),
          );
          onPressed(selectedDateTime);
        }
      },
      style: OutlinedButton.styleFrom(
        shape: const StadiumBorder(),
        padding: const EdgeInsets.symmetric(
          horizontal: 8,
          vertical: 0,
        ),
      ),
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 6,
            ),
            child: Text(formattedDate),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 4,
            ),
            child: const Icon(Icons.date_range),
          ),
        ],
      ),
    );
  }

  Future<void> _showDialog(BuildContext context, Widget child) async {
    await showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        // The Bottom margin is provided to align the popup above the system
        // navigation bar.
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        // Provide a background color for the popup.
        color: CupertinoColors.systemBackground.resolveFrom(context),
        // Use a SafeArea widget to avoid system overlaps.
        child: SafeArea(
          top: false,
          child: child,
        ),
      ),
    );
  }
}
