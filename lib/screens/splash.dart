import 'package:currency_converter/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: SvgPicture.asset(
          darkMode ? SvgAssets.logo_dark : SvgAssets.logo,
          width: 220,
        ),
      ),
    );
  }
}
