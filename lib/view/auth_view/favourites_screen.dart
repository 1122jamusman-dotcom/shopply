import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoply/utils/app_colors.dart';
import 'package:shoply/utils/app_images.dart';
import 'package:shoply/widget/butten_widget.dart';

class FavouritesScreen extends StatelessWidget {
  FavouritesScreen({super.key});
  final List Favourite = [
    {
      'image': AppImages.Favourite1,
      'source': 'Global Summit on Climate Change: Historic Agreement Reached',
      'news': ' BBC News',
      'date': ' Jun 9, 2023',
      'icon': Icons.verified,
      'image1': AppImages.Favourite2,
    },
    {
      'image': AppImages.Favourite1,
      'source': 'Global Summit on Climate Change: Historic Agreement Reached',
      'news': ' BBC News',
      'date': ' Jun 9, 2023',
      'icon': Icons.verified,
      'image1': AppImages.Favourite2,
    },
    {
      'image': AppImages.Favourite1,
      'source': 'Global Summit on Climate Change: Historic Agreement Reached',
      'news': ' BBC News',
      'date': ' Jun 9, 2023',
      'icon': Icons.verified,
      'image1': AppImages.Favourite2,
    },
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
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
              ],
            ),
          );
        },
      ),

      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Padding(
          padding: const EdgeInsets.only(left: 30),
          child: ButtonWidget(hinttext: 'Place Order', onTap: () {}),
        ),
      ),
    );
  }
}
