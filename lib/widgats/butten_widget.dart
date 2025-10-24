import 'package:flutter/material.dart';
import 'package:shoply/utils/app_colors.dart';
class ButtenWidget extends StatelessWidget {
  final String hinttext;
  // final void Function()? onTap;
  const ButtenWidget({super.key, required this.hinttext, 
  
  // required this.onTap
  
  });
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 70,
        decoration: BoxDecoration(
          color: AppColors.ornage,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(hinttext, style: TextStyle(color: Colors.white)),
        ),
      );
    
  }
}





