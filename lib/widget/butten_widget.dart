import 'package:flutter/material.dart';
import 'package:shoply/utils/app_colors.dart';

class ButtenWidget extends StatelessWidget {
  final String hinttext;
  final void Function()? onTap;

  const ButtenWidget({super.key, required this.hinttext, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,

      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: AppColors.ornage,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(hinttext, style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}
