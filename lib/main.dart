import 'package:flutter/material.dart';
import 'package:currency_converter/utils/initialise_injectors.dart';
import 'app.dart';
import 'settings/settings_controller.dart';
import 'settings/settings_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final settingsController = SettingsController(SettingsService());
  await settingsController.loadSettings();

  await initialiseInjectors();

  runApp(MyApp(settingsController: settingsController));
}
