import 'package:currency_converter/utils/colors.dart';
import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final Widget icon;
  final String hint;
  final Function(String) onSearchChanged;
  const CustomTextfield(
      {super.key,
      required this.icon,
      required this.hint,
      required this.onSearchChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(
            Radius.circular(12.0),
          ),
        ),
        fillColor: AppColors.grey,
        filled: true,
        prefixIcon: icon,
        hintText: hint,
        hintStyle: TextStyle(
          color: AppColors.darkGrey.withOpacity(0.7),
        ),
      ),
      onChanged: onSearchChanged,
    );
  }
}
