import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/instance_manager.dart';
import 'package:get/utils.dart';
import 'package:shoply/controllar/book_controller.dart';
import 'package:shoply/utils/app_images.dart';
import 'package:shoply/widget/butten_widget.dart';
import 'package:shoply/widget/text_formfield_widget.dart';

class UploadsBooks extends StatefulWidget {
  const UploadsBooks({super.key});
  @override
  State<UploadsBooks> createState() => _UploadsBooksState();
}

class _UploadsBooksState extends State<UploadsBooks> {
  final TextEditingController bookcontroller = TextEditingController();
  final TextEditingController titlecontroller = TextEditingController();
  final TextEditingController pricecontroller = TextEditingController();
  final TextEditingController overviescontroller = TextEditingController();
  BookController bookControllerGetx = Get.put(BookController());
  String? selectedValue;
  final List<String> categoriesList = ['Novel', 'Stories', 'Study'];
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(backgroundColor: theme.colorScheme.primaryContainer),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Book Thumbnail',
                style: theme.textTheme.bodySmall!.copyWith(
                  color: theme.colorScheme.primary,
                ),
              ),
              Container(
                height: 200.h,
                width: 440.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.sp),
                  color: theme.colorScheme.secondary,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Image.asset(AppImages.Favourite4)],
                ),
              ),
              SizedBox(height: 15.sp),
              Text(
                'Book Category',
                style: theme.textTheme.displayMedium!.copyWith(fontSize: 15.sp),
              ),
              SizedBox(height: 15.sp),
              DropdownButtonFormField<String>(
                initialValue: selectedValue,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.sp),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 12.h,
                  ),
                ),
                hint: const Text('Select item'),
                items: categoriesList.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedValue = value;
                  });
                },
              ),
              SizedBox(height: 15.sp),
              Text(
                'Book Price',
                style: theme.textTheme.displayMedium!.copyWith(fontSize: 15.sp),
              ),
              SizedBox(height: 15.h),
              TextFormfieldWidget(
                controllar: pricecontroller,
                hintText: '\$34',
              ),
              SizedBox(height: 15.h),
              Text(
                'Book Title',
                style: theme.textTheme.displayMedium!.copyWith(fontSize: 15.sp),
              ),
              SizedBox(height: 15.h),
              TextFormfieldWidget(
                controllar: titlecontroller,
                hintText: 'Title',
              ),
              SizedBox(height: 15.h),
              Text(
                'Book Overview',
                style: theme.textTheme.displayMedium!.copyWith(fontSize: 15.sp),
              ),
              SizedBox(height: 15.h),
              TextFormfieldWidget(
                controllar: overviescontroller,
                hintText:
                    'The Catcher in the Rye is a novel by J. D. Salinger...',
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: ButtonWidget(
          hinttext: 'Upload',
          onTap: () {
            print(
              'WWOWOWOWOWOWOWOWOOWOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO',
            );
            print(
              'WWOWOWOWOWOWOWOWOOWOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO',
            );
            print(
              'WWOWOWOWOWOWOWOWOOWOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO',
            );
            print(
              'WWOWOWOWOWOWOWOWOOWOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO',
            );
            print(
              'WWOWOWOWOWOWOWOWOOWOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO',
            );
            print(
              'WWOWOWOWOWOWOWOWOOWOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO',
            );
            print(
              'WWOWOWOWOWOWOWOWOOWOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO',
            );
            print(
              'WWOWOWOWOWOWOWOWOOWOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO',
            );
            print(
              'WWOWOWOWOWOWOWOWOOWOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO',
            );
            print(
              'WWOWOWOWOWOWOWOWOOWOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO',
            );
            bookControllerGetx.uploadbook(
              titlecontroller.text.trim(),
              'author',
              overviescontroller.text.trim(),
              'https://miblart.com/wp-content/uploads/2024/01/main-3-1-scaled.jpg',
              pricecontroller.text.trim(),
              'category',
              3.5,
              5,
              DateTime.now(),
            );
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
