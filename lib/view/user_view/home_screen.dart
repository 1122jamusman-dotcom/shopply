import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:shoply/utils/app_colors.dart';
import 'package:shoply/utils/app_images.dart';
import 'package:shoply/view/auth_view/favourites_screen.dart';
import 'package:shoply/view/upload_category.dart';
import 'package:shoply/view/uploads_books.dart';
import 'package:shoply/view/user_view/detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  List data = [
    {
      'image': AppImages.book_1,
      'bookname': 'Catcher in the Rye',
      'writerName': 'J.D. Salinger',
    },
    {
      'image': AppImages.book_2,
      'bookname': 'Someone Like You',
      'writerName': 'Roald Dahl',
    },
    {
      'image': AppImages.book_3,
      'bookname': 'Catcher in the Rye',
      'writerName': 'J.D. Salinger',
    },
    {
      'image': AppImages.book_4,
      'bookname': 'Catcher in the Rye',
      'writerName': 'J.D. Salinger',
    },

    {
      'image': AppImages.book_5,
      'bookname': 'Catcher in the Rye',
      'writerName': 'J.D. Salinger',
    },

    {
      'image': AppImages.book_6,
      'bookname': 'Catcher in the Rye',
      'writerName': 'J.D. Salinger',
    },
  ];

  late TabController tabController;

  bool isSwitched = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.primaryContainer,
        title: Padding(
          padding: EdgeInsets.only(left: 10.w),
          child: GestureDetector(
            onTap: () {
              Get.off(FavouritesScreen());
            },
            child: Icon(
              Icons.bookmark,
              color: theme.colorScheme.secondaryContainer,
            ),
          ),
        ),

        actions: [
          Switch(
            value: isSwitched,
            onChanged: (value) {
              setState(() {
                isSwitched = value;
              });
            },
          ),
          SizedBox(width: 10.w),
          CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage(AppImages.profilePhoto),
          ),
          SizedBox(width: 10.w),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 30.w, top: 30.h),
                child: Text(
                  'Welcome Back, Bunny!',
                  style: theme.textTheme.bodyLarge,
                ),
              ),

              Padding(
                padding: EdgeInsets.only(left: 30.w),
                child: Text(
                  'What do you want to \nread today?',
                  style: theme.textTheme.headlineLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: TextFormField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.grey.withValues(alpha: 0.3),
                    hintText: 'Search',
                    hintStyle: theme.textTheme.bodyMedium!.copyWith(
                      fontSize: 16.sp,
                    ),

                    prefixIcon: const Icon(Icons.search, color: Colors.grey),
                    suffixIcon: const Icon(Icons.mic, color: Colors.grey),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 35.h),

              /// here is the tapbar 😋
              TabBar(
                labelColor: Colors.black,
                indicatorColor: AppColors.ornage,
                labelStyle: TextStyle(fontWeight: FontWeight.bold),
                unselectedLabelColor: Colors.grey,
                controller: tabController,
                tabs: [
                  Text('Novel', overflow: TextOverflow.ellipsis),
                  Text('Self-love', overflow: TextOverflow.ellipsis),
                  Text('Science', overflow: TextOverflow.ellipsis),
                  Text('Romance', overflow: TextOverflow.ellipsis),
                ],
              ),
              SizedBox(height: 15.h),
              GestureDetector(
                onTap: () {},
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: GestureDetector(
                    onTap: () {
                      Get.off(UploadCategory());
                    },
                    child: CircleAvatar(
                      backgroundColor: theme.colorScheme.secondaryContainer,
                      child: Icon(
                        Icons.add,
                        color: theme.colorScheme.primaryContainer,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 15.h),

              SizedBox(
                height: 600.h,
                child: TabBarView(
                  controller: tabController,
                  children: [
                    GridView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: data.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 0.57,
                        crossAxisCount: 2,
                      ),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => Get.to(
                            () => DetailScreen(),
                            arguments: {
                              'bookname': data[index]['bookname'],
                              'image': data[index]['image'],
                              'writername': data[index]['writerName'],
                            },
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Image.network(
                                  data[index]['image'],
                                  errorBuilder: (context, error, stackTrace) {
                                    return Icon(Icons.broken_image_outlined);
                                  },
                                ),
                              ),

                              Text(
                                data[index]['bookname'],
                                style: theme.textTheme.bodyLarge!.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.only(right: 70.w),
                                child: Text(
                                  data[index]['writerName'],
                                  style: theme.textTheme.bodyMedium,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    Center(
                      child: Text(
                        'Self-love',
                        style: theme.textTheme.labelLarge,
                      ),
                    ),
                    Center(
                      child: Text('Science', style: theme.textTheme.labelLarge),
                    ),
                    Center(
                      child: Text('Romance', style: theme.textTheme.labelLarge),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Align(
        alignment: AlignmentGeometry.bottomRight,
        child: GestureDetector(
          onTap: () {
            Get.off(UploadsBooks());
          },
          child: Container(
            height: 70.h,
            width: 70.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.redAccent,
            ),
            child: Icon(Icons.add, size: 60.h, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
