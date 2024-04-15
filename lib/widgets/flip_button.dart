import 'package:currency_converter/utils/assets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class FlipButton extends StatelessWidget {
  final Function() onPress;
  const FlipButton({
    super.key,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPress,
      child: const Icon(
        CupertinoIcons.arrow_up_arrow_down,
      ),
    );
  }
}
