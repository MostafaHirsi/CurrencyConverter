import 'package:currency_converter/utils/colors.dart';
import 'package:flutter/material.dart';

ThemeData theme = ThemeData(
  useMaterial3: true,
  fontFamily: 'Montserrat',
  splashFactory: NoSplash.splashFactory,
  dividerColor: AppColors.grey,
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      backgroundColor: AppColors.grey,
      shape: const CircleBorder(),
      side: BorderSide.none,
      padding: const EdgeInsets.all(12),
      foregroundColor: Colors.black,
    ),
  ),
  progressIndicatorTheme: const ProgressIndicatorThemeData(
    color: Colors.grey,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(
        horizontal: 48,
      ),
      backgroundColor: AppColors.orange,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(
            6,
          ),
        ),
      ),
      foregroundColor: Colors.white,
      disabledForegroundColor: Colors.grey,
    ),
  ),
  iconTheme: const IconThemeData(
    color: Colors.black,
  ),
);

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  fontFamily: 'Montserrat',
  splashFactory: NoSplash.splashFactory,
  scaffoldBackgroundColor: Colors.black,
  appBarTheme: const AppBarTheme(
    color: Colors.black,
  ),
  progressIndicatorTheme: const ProgressIndicatorThemeData(
    color: Colors.grey,
  ),
  dividerColor: AppColors.darkerGrey,
  outlinedButtonTheme: OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      backgroundColor: AppColors.darkerGrey,
      shape: const CircleBorder(),
      side: BorderSide.none,
      padding: const EdgeInsets.all(12),
      foregroundColor: Colors.white,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      padding: const EdgeInsets.symmetric(
        horizontal: 0,
      ),
      backgroundColor: AppColors.orange,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(
            6,
          ),
        ),
      ),
      foregroundColor: Colors.white,
      disabledForegroundColor: Colors.grey,
    ),
  ),
  iconTheme: const IconThemeData(
    color: Colors.white,
  ),
);
