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
      'news': '  BBC News  ',
      'date': '  Jun 9, 2023',
      'icon': Icons.verified,
      'image1': AppImages.favourite2,
    },
    {
      'image': AppImages.favourite1,
      'source': 'Global Summit on Climate Change: Historic Agreement Reached',
      'news': '  BBC News  ',
      'date': '  Jun 9, 2023',
      'icon': Icons.verified,
      'image1': AppImages.favourite2,
    },
    {
      'image': AppImages.favourite1,
      'source': 'Global Summit on Climate Change: Historic Agreement Reached',
      'news': '  BBC News  ',
      'date': '  Jun 9, 2023',
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
        centerTitle: true,

        title: Text(
          'Favourite',
          style: theme.textTheme.bodyLarge!.copyWith(
            fontWeight: FontWeight.bold,
            fontSize: 16.sp,
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: Favourite.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.h, vertical: 30.w),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 150.h,
                  width: 150.w,
                  child: Image.asset(
                    Favourite[index]['image'],
                    fit: BoxFit.cover,
                  ),
                ),

                SizedBox(width: 20.w),

                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.w),
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
                        Row(
                          children: [
                            Image.asset(Favourite[index]['image1']),
                            Text(Favourite[index]['news']),
                            Icon(Icons.verified, color: AppColors.info),
                            Text(Favourite[index]['date']),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),

      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.h),
        child: ButtonComponent(hinttext: 'Place Order', ontap: () {}),
      ),
    );
  }
}
