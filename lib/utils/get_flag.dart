import 'package:currency_converter/models/currency/currency.dart';
import 'package:flag/flag_widget.dart';
import 'package:flutter/material.dart';

Flag getFlag(String currencyCode, double iconSize) {
  String code = currencyCode.substring(0, 2).toLowerCase();
  return Flag.fromString(
    code,
    width: iconSize,
    height: iconSize,
    borderRadius: 100,
    fit: BoxFit.fitHeight,
  );
}
