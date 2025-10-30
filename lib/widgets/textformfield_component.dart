import 'package:flutter/material.dart';

import 'package:shoply/utils/app_colors.dart';

// ignore: must_be_immutable
class TextformFieldComponent extends StatelessWidget {
  final TextEditingController controller;
  IconData? prefixIcon;
  int maxLines;
  final String hintText;
  IconData? suffixIcon;
  TextformFieldComponent({
    super.key,
    this.maxLines = 1,
    required this.controller,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
  });
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TextFormField(
      maxLines: maxLines,
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: Icon(prefixIcon, color: theme.colorScheme.secondary),
        suffixIcon: Icon(suffixIcon, color: theme.colorScheme.secondary),
        filled: true,
        fillColor: AppColors.background,
        contentPadding: EdgeInsets.symmetric(horizontal: 2),
        hintText: hintText,
        hintStyle: theme.textTheme.bodyLarge,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
