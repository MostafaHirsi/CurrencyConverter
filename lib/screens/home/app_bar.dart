import 'package:currency_converter/screens/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeAppBar extends AppBar {
  final BuildContext context;
  HomeAppBar({super.key, required this.context});

  @override
  List<Widget> get actions => [
        IconButton(
          onPressed: navigateToSettings,
          icon: buildIcon(),
        )
      ];

  Icon buildIcon() {
    return const Icon(
      Icons.settings,
    );
  }

  void navigateToSettings() {
    Navigator.pushNamed(
      context,
      Settings.routeName,
    );
  }
}
