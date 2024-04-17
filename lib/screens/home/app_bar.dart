import 'package:currency_converter/screens/settings/settings.dart';
import 'package:flutter/material.dart';
import 'package:injector/injector.dart';

class HomeAppBar extends AppBar {
  HomeAppBar({super.key});

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
    GlobalKey<NavigatorState> navigatorKey = Injector.appInstance.get();
    navigatorKey.currentState!.pushNamed(Settings.routeName);
  }
}
