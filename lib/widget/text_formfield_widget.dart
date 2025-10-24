import 'package:flutter/material.dart';
import 'package:shoply/utils/app_colors.dart';

class TextFormfieldWidget extends StatelessWidget {
  String hintText;
  IconData prefixIcon;
  TextFormfieldWidget({
    super.key,
    required this.hintText,
    required this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.grey, fontWeight: FontWeight.w300),
        focusColor: AppColors.textSecondary,
        prefixIcon: Icon(prefixIcon, color: Colors.grey),
        filled: true,
        fillColor: AppColors.cardBackground,

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
