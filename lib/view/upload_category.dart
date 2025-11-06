import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shoply/controllar/book_controller.dart';
import 'package:shoply/widget/butten_widget.dart';
import 'package:shoply/widget/text_formfield_widget.dart';

class UploadCategory extends StatelessWidget {
  final TextEditingController bookTextcontroller = TextEditingController();
  final bookController = Get.put(BookController());
  UploadCategory({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      floatingActionButton: Padding(
        padding: EdgeInsets.only(left: 30.w),
        child: ButtonWidget(
          hinttext: 'Upload',
          onTap: () {
            final String category = bookTextcontroller.text.trim();
            bookController.uploadCategory(category);
          },
        ),
      ),
      appBar: AppBar(backgroundColor: theme.colorScheme.primaryContainer),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15.h),
            Text(
              'Category Name',
              style: theme.textTheme.displayMedium!.copyWith(
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 15.h),
            TextFormfieldWidget(
              controllar: bookTextcontroller,
              hintText: 'Novel',
            ),
            SizedBox(height: 400.h),
          ],
        ),
      ),
    );
  }
}
