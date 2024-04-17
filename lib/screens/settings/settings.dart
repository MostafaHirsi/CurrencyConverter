import 'package:currency_converter/blocs/app/app_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  static const routeName = '/settings';

  @override
  Widget build(BuildContext context) {
    AppBloc appBloc = BlocProvider.of(context);
    return BlocBuilder(
      bloc: appBloc,
      builder: (context, state) {
        ThemeMode themeMode =
            state is AppLoaded ? state.themeMode : ThemeMode.system;
        return Scaffold(
          appBar: AppBar(
            title: const Text('Settings'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: DropdownButton<ThemeMode>(
              value: themeMode,
              onChanged: (value) {
                if (value != null) {
                  appBloc.add(UpdateThemeMode(themeMode: value));
                }
              },
              items: const [
                DropdownMenuItem(
                  value: ThemeMode.system,
                  child: Text('System Theme'),
                ),
                DropdownMenuItem(
                  value: ThemeMode.light,
                  child: Text('Light Theme'),
                ),
                DropdownMenuItem(
                  value: ThemeMode.dark,
                  child: Text('Dark Theme'),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
