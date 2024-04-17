import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final bool isLoading;
  final bool isEnabled;
  final Function() onPress;
  const PrimaryButton(
      {super.key,
      required this.text,
      this.isLoading = false,
      this.isEnabled = true,
      required this.onPress});

  @override
  Widget build(BuildContext context) {
    double textPadding = isLoading ? 38 : 48;
    double loadingIndicatorPadding = isLoading ? 10 : 0;
    return ElevatedButton(
      style: ElevatedButton.styleFrom(),
      onPressed: !isLoading && isEnabled ? onPress : null,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            margin: EdgeInsets.only(left: 48, right: textPadding),
            child: Text(
              text,
              style: const TextStyle(
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          if (isLoading)
            Container(
              width: 20,
              height: 20,
              margin: EdgeInsets.only(
                right: loadingIndicatorPadding,
              ),
              child: const CircularProgressIndicator(),
            )
        ],
      ),
    );
  }
}
