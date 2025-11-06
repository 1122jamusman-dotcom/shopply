import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shoply/controller/feature_controller/category_controller.dart';

import 'package:shoply/widgets/button_component.dart';
import 'package:shoply/widgets/textformfield_component.dart';

class UploadCategory extends StatelessWidget {
  final TextEditingController bookcontroller = TextEditingController();

  UploadCategory({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final categoryController = Get.put(CategoryController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
            TextformFieldComponent(
              controller: bookcontroller,
              hintText: 'Novel',
            ),
            SizedBox(height: 500.h),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ButtonComponent(
          hinttext: 'Upload',
          ontap: () async {
            final String categrey = bookcontroller.text.trim();
            categoryController.UploadCategory(categrey);
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
