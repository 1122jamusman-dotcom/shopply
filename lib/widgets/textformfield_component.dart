import 'package:flutter/material.dart';
import 'package:shoply/utils/app_colors.dart';

// ignore: must_be_immutable
class TextformFieldComponent extends StatelessWidget {
  final TextEditingController controller;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final int maxLines;
  final String hintText;
  final bool enable;

  const TextformFieldComponent({
    super.key,
    this.maxLines = 1,
    required this.controller,
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    this.enable = true,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return TextFormField(
      enabled: enable,
      maxLines: maxLines,
      controller: controller,
      decoration: InputDecoration(
        prefixIcon: prefixIcon != null
            ? Icon(prefixIcon, color: theme.colorScheme.secondary)
            : null,
        suffixIcon: suffixIcon != null
            ? Icon(suffixIcon, color: theme.colorScheme.secondary)
            : null,
        filled: true,
        fillColor: AppColors.background,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 14,
        ),
        hintText: hintText,
        hintStyle: theme.textTheme.bodyLarge,
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
