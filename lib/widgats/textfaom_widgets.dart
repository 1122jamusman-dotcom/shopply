import 'package:flutter/material.dart';
import 'package:shoply/utils/app_colors.dart';
 
class TextfaomWidgets extends StatelessWidget {
  final TextEditingController controller;
  int maxLines ;
  final String hintText;
 TextfaomWidgets({super.key ,
 this.maxLines = 1
 ,required this.controller , required this.hintText});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
controller:controller ,

decoration: InputDecoration(
  filled: true,
  fillColor: AppColors.background,
  contentPadding: EdgeInsets.symmetric(horizontal: 2),

  hintText: hintText , 
  
  enabledBorder: OutlineInputBorder(
    
  borderSide: BorderSide(color: Colors.transparent),
    borderRadius: BorderRadius.circular(10) ,
    
    
    
     ),

  focusedBorder: OutlineInputBorder(
    
  borderSide: BorderSide(color: Colors.transparent),
    borderRadius: BorderRadius.circular(10) ,
    
    
    
     )),
    );
  }
}