import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:shoply/view/auth_view/favourites_screen.dart';
import 'package:shoply/view/user_view/preview_screen.dart';
import 'package:shoply/widgets/button_component.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final arg = Get.arguments;
    return Scaffold(
      appBar: AppBar(backgroundColor: theme.colorScheme.primaryContainer),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: SizedBox(
                    height: 300,
                    width: 300,
                    child: ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(20),
                      child: Image.network(
                        fit: BoxFit.fill,
                        arg['image'],
                        errorBuilder: (context, error, stackTrace) {
                          return Icon(Icons.broken_image_outlined);
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Center(
                  child: Text(
                    arg['bookname'],
                    style: theme.textTheme.titleSmall!.copyWith(
                      fontSize: 18.sp,
                      color: theme.colorScheme.primary,

                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 5),

                Center(
                  child: Text(
                    arg['writerName'],
                    style: theme.textTheme.bodyMedium!.copyWith(
                      fontSize: 16.sp,
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                Padding(
                  padding: EdgeInsets.only(left: 10.w),
                  child: Text(
                    'About The Author',
                    style: theme.textTheme.titleSmall!.copyWith(
                      fontSize: 18.sp,
                      color: theme.colorScheme.primary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 10.sp),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Text(
                    'J.D. Salinger was an American writer, best known for his 1951 novel The Catcher in the Rye. Before its publi cation, Salinger published several short stories in Story magazine',
                  ),
                ),
                SizedBox(height: 10.h),
                Padding(
                  padding: EdgeInsets.only(left: 10.w),
                  child: Text(
                    'Overview',
                    style: theme.textTheme.titleSmall!.copyWith(
                      fontSize: 18.sp,
                      color: theme.colorScheme.primary,

                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Text(
                    'The Catcher in the Rye is a novel by J. D. Salinger, partially published in serial form in 1945–1946 and as a novel in 1951. It was originally intended for adu lts but is often read by adolescents for its theme of angst, alienation and as a critique...',
                  ),
                ),
                SizedBox(height: 60.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ButtonComponent(
                        hinttext: 'Read Preview',
                        ontap: () {
                          Get.to(PreviewScreen());
                        },
                        width: 173.w,
                      ),
                      GestureDetector(
                        child: ButtonComponent(
                          hinttext: 'Add To Favourite',
                          ontap: () {
                            Get.to(FavouritesScreen());
                          },
                          color: theme.colorScheme.primary,
                          width: 173.w,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
