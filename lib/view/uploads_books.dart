import 'package:flutter/material.dart';
import 'package:shoply/utils/app_colors.dart';
import 'package:shoply/utils/app_images.dart';
import 'package:shoply/view/upload_category.dart';
import 'package:shoply/widgats/butten_widget.dart';
import 'package:shoply/widgats/textfaom_widgets.dart';

class UploadsBooks extends StatelessWidget {
  UploadsBooks({super.key});
final TextEditingController bookcontroller=TextEditingController();
final TextEditingController titlecontroller=TextEditingController();
final TextEditingController pricecontroller=TextEditingController();
final TextEditingController overviescontroller=TextEditingController();
  @override
  Widget build(BuildContext context) {
     final theme = Theme.of(context);
     
    return Scaffold(appBar: AppBar(
leading: Icon(Icons.arrow_back),
    ), 
    body:Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment:MainAxisAlignment.start ,
          children: [
        
          Container(
            height: 200,
            width: 440,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)
            ,color: AppColors.textSecondary
            
            ),
            
           child: Column(mainAxisAlignment: MainAxisAlignment.center,
           crossAxisAlignment: CrossAxisAlignment.center
           ,
             children: [
               Image.asset(AppImages.Favourite4),
             ],
           ),
           
           
           
            ),
             SizedBox(height: 15,),
          Text('Book Category',style: theme.textTheme.displayMedium!.copyWith(fontSize: 15)),
          SizedBox(height: 15,),
          TextfaomWidgets(controller:bookcontroller, hintText:' Noval'),
           SizedBox(height: 15,),
          Text('Book Price',style: theme.textTheme.displayMedium!.copyWith(fontSize: 15)),
          SizedBox(height: 15,),
          TextfaomWidgets(controller:pricecontroller, hintText:' \$34'),
           SizedBox(height: 15,),
          Text('Book Title',style: theme.textTheme.displayMedium!.copyWith(fontSize: 15)),
          SizedBox(height: 15,),
          TextfaomWidgets(controller:titlecontroller, hintText:' Title'),
           SizedBox(height: 15,),
          Text('Book Overview',style: theme.textTheme.displayMedium!.copyWith(fontSize: 15)),
          SizedBox(height: 15,),
          TextfaomWidgets(
            maxLines: 8,
            controller:overviescontroller, hintText:' The Catcher in the Rye is a novel by J. D. Salinger, partially published in serial form in 1945–1946 and as a novel in 1951. It was originally intended for adu lts but is often read by adolescents for its theme of angst, alienation and as a critique......'),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: ButtenWidget(hinttext:'Upload',),
        )
        ],),
      ),
    ) ,);
  }
} 