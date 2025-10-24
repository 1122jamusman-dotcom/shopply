import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoply/utils/app_colors.dart';
import 'package:shoply/utils/app_images.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  bool istap = false;
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
        title: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: GestureDetector(
            onTap: () {
              setState(() {
                istap = !istap;
              });
            },
            child: Icon(
              Icons.bookmark,
              color: istap == true ? AppColors.ornage : AppColors.textSecondary,
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 30),
              child: Text(
                'Welcome Back, Bunny!',
                style: theme.textTheme.bodyMedium,
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'What do you want to \nread today?',
                style: theme.textTheme.displayMedium!.copyWith(
                  fontWeight: FontWeight.w100,
                ),
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextFormField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey.withValues(alpha: 0.3),
                  hintText: 'Search',
                  hintStyle: theme.textTheme.bodyMedium!.copyWith(fontSize: 16),

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
            SizedBox(height: 35),

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
            SizedBox(height: 15),
            GestureDetector(
              onTap: () {},
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  height: 30,
                  width: 30,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.ornage,
                  ),
                  child: Icon(Icons.add, color: AppColors.background, size: 30),
                ),
              ),
            ),
            SizedBox(height: 15),

            Expanded(
              child: TabBarView(
                controller: tabController,
                children: [
                  GridView.builder(
                    itemCount: data.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 0.57,
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context, index) {
                      return Container(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Image.asset(data[index]['image']),
                            ),

                            Text(
                              data[index]['bookname'],
                              style: theme.textTheme.bodyLarge!.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 70),
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
                    child: Text('Self-love', style: theme.textTheme.labelLarge),
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
      floatingActionButton: Align(
        alignment: AlignmentGeometry.bottomRight,
        child: Container(
          height: 70,
          width: 70,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.redAccent,
          ),
          child: Icon(Icons.add, size: 70, color: Colors.white),
        ),
      ),
    );
  }
}
