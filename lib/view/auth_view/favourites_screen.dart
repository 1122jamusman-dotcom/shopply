import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoply/utils/app_colors.dart';
import 'package:shoply/utils/app_images.dart';
import 'package:shoply/widgets/button_component.dart';

class FavouritesScreen extends StatelessWidget {
  FavouritesScreen({super.key});
  final List Favourite = [
    {
      'image': AppImages.favourite1,
      'source': 'Global Summit on Climate Change: Historic Agreement Reached',
      'news': 'BBC News',
      'date': 'Jun 9, 2023',
      'icon': Icons.verified,
      'image1': AppImages.favourite2,
    },
    {
      'image': AppImages.favourite1,
      'source': 'Global Summit on Climate Change: Historic Agreement Reached',
      'news': 'BBC News',
      'date': 'Jun 9, 2023',
      'icon': Icons.verified,
      'image1': AppImages.favourite2,
    },
    {
      'image': AppImages.favourite1,
      'source': 'Global Summit on Climate Change: Historic Agreement Reached',
      'news': ' BBC News',
      'date': 'Jun 9, 2023',
      'icon': Icons.verified,
      'image1': AppImages.favourite2,
    },
  ];
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.primaryContainer,
        title: Text(
          'Favourite',
          style: theme.textTheme.titleMedium!.copyWith(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: Favourite.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 110.h,
                  width: 100.w,
                  child: Image.asset(
                    Favourite[index]['image'],
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 10.w),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        Favourite[index]['source'],
                        style: theme.textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
                        ),
                        softWrap: true,
                        overflow: TextOverflow.visible,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            SizedBox(width: 5.w),
                            Image.asset(Favourite[index]['image1']),
                            Text(Favourite[index]['news']),
                            Icon(Icons.verified, color: AppColors.info),
                            Text(Favourite[index]['date']),
                            SizedBox(width: 5.w),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Padding(
          padding: const EdgeInsets.only(left: 30),
          child: ButtonComponent(hinttext: 'Place Order', ontap: () {}),
        ),
      ),
    );
  }
}
