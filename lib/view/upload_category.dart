import 'package:flutter/material.dart';
import 'package:shoply/widgats/butten_widget.dart';
import 'package:shoply/widgats/textfaom_widgets.dart';

class UploadCategory extends StatelessWidget {
final TextEditingController bookcontroller=TextEditingController();

   UploadCategory({super.key});

  @override
  Widget build(BuildContext context) {
  
      final theme = Theme.of(context);

    return Scaffold(appBar: AppBar(
leading: Icon(Icons.arrow_back),
    ), 
    body: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start
        ,crossAxisAlignment:CrossAxisAlignment.start ,
        children: [   SizedBox(height: 15,),
            Text('Book Category',style: theme.textTheme.displayMedium!.copyWith(fontSize: 15)),
            SizedBox(height: 15,),
            TextfaomWidgets(controller:bookcontroller, hintText:' Noval'),
             SizedBox(height: 320,),
             
            ButtenWidget(hinttext: 'Upload ', )
             ],),
    ),

           
    );
  }
}