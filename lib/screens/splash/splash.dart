import 'package:currency_converter/blocs/app/app_bloc.dart';
import 'package:currency_converter/screens/home/home.dart';
import 'package:currency_converter/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:injector/injector.dart';

class Splash extends StatefulWidget {
  final ThemeMode themeMode;
  const Splash({
    super.key,
    required this.themeMode,
  });

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    bool darkMode = widget.themeMode == ThemeMode.dark;
    AppBloc appBloc = BlocProvider.of(context);
    GlobalKey<NavigatorState> navigatorKey = Injector.appInstance.get();
    return BlocListener(
      bloc: appBloc,
      listener: (context, state) async {
        if (state is AppLoaded) {
          await navigatorKey.currentState!.pushReplacementNamed(Home.routeName,
              arguments: state.currencies);
        }
      },
      child: Scaffold(
        body: Container(
          alignment: Alignment.center,
          child: SvgPicture.asset(
            darkMode ? SvgAssets.logo_dark : SvgAssets.logo,
            width: 220,
          ),
        ),
      ),
    );
  }
}
