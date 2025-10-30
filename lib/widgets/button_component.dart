import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class ButtonComponent extends StatelessWidget {
  final String hinttext;
  final VoidCallback ontap;
  final double? width;
  // final void Function()? onTap;
  ButtonComponent({
    super.key,
    required this.hinttext,
    required this.ontap,
    this.width,
    // required this.onTap
  });
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      height: 55.h,
      width: width ?? double.infinity,
      decoration: BoxDecoration(
        color: theme.colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(hinttext, style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
