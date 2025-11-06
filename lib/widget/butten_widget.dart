import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoply/utils/app_colors.dart';

class ButtonWidget extends StatelessWidget {
  final String hinttext;
  final void Function()? onTap;
  final Color? Buttoncolor;
  final Color? buttonTextColor;
  double? width;

  ButtonWidget({
    super.key,
    required this.hinttext,
    required this.onTap,
    this.width = double.infinity,
    this.Buttoncolor,
    this.buttonTextColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: onTap,

      child: Container(
        height: 50.h,
        width: width,
        decoration: BoxDecoration(
          color: Buttoncolor ?? AppColors.ornage,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            hinttext,
            style: TextStyle(
              color: buttonTextColor ?? theme.colorScheme.surface,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
