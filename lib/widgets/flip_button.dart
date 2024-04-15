import 'package:currency_converter/utils/assets.dart';
import 'package:currency_converter/utils/colors.dart';
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
      style: OutlinedButton.styleFrom(
        shape: const CircleBorder(),
        side: BorderSide.none,
        padding: const EdgeInsets.all(12),
        backgroundColor: AppColors.grey,
      ),
      onPressed: onPress,
      child: SvgPicture.asset(
        SvgAssets.flip,
        height: 18,
      ),
    );
  }
}
