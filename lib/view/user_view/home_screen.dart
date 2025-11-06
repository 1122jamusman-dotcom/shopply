// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shoply/controller/ui_controller/switch_button_controller.dart';

import 'package:shoply/utils/app_images.dart';
import 'package:shoply/view/auth_view/favourites_screen.dart';
import 'package:shoply/view/auth_view/profile_screen.dart';
import 'package:shoply/view/upload_category.dart';
import 'package:shoply/view/uploads_books.dart';
import 'package:shoply/view/user_view/detail_screen.dart';
import 'package:shoply/widgets/textformfield_component.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  TextEditingController searchController = TextEditingController();

  // --- Dummy Book Data ---
  List data = [
    {
      'image': AppImages.book_1,
      'bookname': 'Catcher in the Rye',
      'writerName': 'J.D. Salinger',
      'category': 'Novel',
    },
    {
      'image': AppImages.book_2,
      'bookname': 'Someone Like You',
      'writerName': 'Roald Dahl',
      'category': 'Self-love',
    },
    {
      'image': AppImages.book_3,
      'bookname': 'Astrophysics for People',
      'writerName': 'Neil deGrasse Tyson',
      'category': 'Science',
    },
    {
      'image': AppImages.book_4,
      'bookname': 'Pride and Prejudice',
      'writerName': 'Jane Austen',
      'category': 'Romance',
    },
    {
      'image': AppImages.book_5,
      'bookname': 'To Kill a Mockingbird',
      'writerName': 'Harper Lee',
      'category': 'Novel',
    },
    {
      'image': AppImages.book_6,
      'bookname': 'The Great Gatsby',
      'writerName': 'F. Scott Fitzgerald',
      'category': 'Novel',
    },
  ];

  late TabController tabController;
  final switchButtonController = Get.put(SwitchButtonController());

  @override
  void initState() {
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
              Get.to(FavouritesScreen());
            },
            child: Icon(
              Icons.bookmark,
              color: theme.colorScheme.secondaryContainer,
            ),
          ),
        ),
        actions: [
          Obx(() {
            return Switch(
              value: switchButtonController.isEnabled.value,
              onChanged: (value) {
                switchButtonController.swipeSwitch(value);
              },
            );
          }),
          SizedBox(width: 10.w),
          GestureDetector(
            onTap: () {
              Get.to(ProfileScreen());
            },
            child: CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage(AppImages.profilePhoto),
            ),
          ),
          SizedBox(width: 10.w),
        ],
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // --- Greeting Section ---
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
              SizedBox(height: 20.h),

              // --- Search Bar ---
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: TextformFieldComponent(
                  controller: searchController,
                  hintText: 'Search',
                  prefixIcon: Icons.search,
                  suffixIcon: Icons.mic,
                ),
              ),
              SizedBox(height: 35.h),

              // --- Tab Bar ---
              TabBar(
                labelColor: theme.colorScheme.primary,
                indicatorColor: theme.colorScheme.secondaryContainer,
                labelStyle: TextStyle(fontWeight: FontWeight.bold),
                unselectedLabelColor: Colors.grey,
                controller: tabController,
                isScrollable: true,
                tabs: const [
                  Text('Novel', overflow: TextOverflow.ellipsis),
                  Text('Self-love', overflow: TextOverflow.ellipsis),
                  Text('Science', overflow: TextOverflow.ellipsis),
                  Text('Romance', overflow: TextOverflow.ellipsis),
                ],
              ),

              SizedBox(height: 15.h),

              // --- Add Category Button ---
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: GestureDetector(
                  onTap: () => Get.to(UploadCategory()),
                  child: CircleAvatar(
                    backgroundColor: theme.colorScheme.secondaryContainer,
                    child: Icon(
                      Icons.add,
                      color: theme.colorScheme.primaryContainer,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 15.h),

              // --- TabBar View (Filtered Books) ---
              SizedBox(
                height: 600.h,
                child: TabBarView(
                  controller: tabController,
                  children: [
                    buildBookGrid('Novel', theme),
                    buildBookGrid('Self-love', theme),
                    buildBookGrid('Science', theme),
                    buildBookGrid('Romance', theme),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      // --- Floating Action Button ---
      floatingActionButton: Align(
        alignment: Alignment.bottomRight,
        child: GestureDetector(
          onTap: () => Get.to(UploadsBooks()),
          child: Container(
            height: 70.h,
            width: 70.w,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.redAccent,
            ),
            child: Icon(Icons.add, size: 40.h, color: Colors.white),
          ),
        ),
      ),
    );
  }

  // --- Reusable Book Grid Function ---
  Widget buildBookGrid(String category, ThemeData theme) {
    final filteredBooks = data
        .where((book) => book['category'] == category)
        .toList();

    if (filteredBooks.isEmpty) {
      return Center(
        child: Text(
          'No books available in $category',
          style: theme.textTheme.bodyMedium,
        ),
      );
    }

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: filteredBooks.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 0.57,
      ),
      itemBuilder: (context, index) {
        final book = filteredBooks[index];
        return GestureDetector(
          onTap: () => Get.to(
            () => DetailScreen(),
            arguments: {
              'bookname': book['bookname'],
              'image': book['image'],
              'writerName': book['writerName'],
            },
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(
                  book['image'],
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(Icons.broken_image_outlined);
                  },
                ),
              ),
              Text(
                book['bookname'],
                style: theme.textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 70.w),
                child: Text(
                  book['writerName'],
                  style: theme.textTheme.bodyMedium,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
