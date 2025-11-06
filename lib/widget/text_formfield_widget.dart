import 'package:flutter/material.dart';
import 'package:shoply/utils/app_colors.dart';

class TextFormfieldWidget extends StatelessWidget {
  String hintText;
  IconData? prefixIcon;
  IconData? suffixIcon;
  TextEditingController controllar;
  bool isPassword;
  int maxLines;
  TextFormfieldWidget({
    super.key,
    required this.hintText,
    this.prefixIcon,
    required this.controllar,
    this.suffixIcon,
    this.isPassword = false,
    this.maxLines = 1,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    Widget? passwordIcon = Icon(suffixIcon, color: theme.colorScheme.secondary);
    return TextFormField(
      maxLines: maxLines,
      controller: controllar,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.w300),
        focusColor: AppColors.textSecondary,
        prefixIcon: Icon(prefixIcon, color: Colors.grey),

        suffixIcon: isPassword == true ? passwordIcon : SizedBox(),
        suffixIconColor: Colors.white,
        filled: true,
        fillColor: AppColors.textSecondary,

        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
      keyboardType: TextInputType.emailAddress,
    );
  }
}
