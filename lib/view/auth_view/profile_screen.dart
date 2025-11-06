import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shoply/controller/feature_controller/user_info_controler.dart';

import 'package:shoply/utils/app_images.dart';
import 'package:shoply/widgets/button_component.dart';
import 'package:shoply/widgets/textformfield_component.dart';

class ProfileScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController aboutController = TextEditingController();

  ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final controller = Get.put(UserInfoControler());

    // Fetch data from Firestore when screen opens
    controller.fetchUserInfo();
    UserInfoControler userInfoControler = Get.put(UserInfoControler());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theme.colorScheme.primaryContainer,
        title: Padding(
          padding: EdgeInsets.only(left: 270.w),
          child: Text(
            'Save',
            style: theme.textTheme.bodyLarge!.copyWith(
              color: theme.colorScheme.secondaryContainer,
            ),
          ),
        ),
      ),
      body: Obx(() {
        final user = controller.userInfo.value;

        if (user == null) {
          return const Center(child: CircularProgressIndicator());
        }

        // fill textfields with Firestore data
        emailController.text = user.email;
        aboutController.text = user.about;

        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20.h),

                // Profile Image
                Center(
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 85,
                        backgroundImage: user.profileImage.isNotEmpty
                            ? NetworkImage(user.profileImage)
                            : AssetImage(AppImages.favourite3) as ImageProvider,
                      ),
                      Positioned(
                        top: 120,
                        right: 0,
                        child: Container(
                          width: 30,
                          height: 30,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: theme.colorScheme.secondaryContainer,
                          ),
                          child: const Icon(Icons.image),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 20.h),

                // Name Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      user.name,
                      style: theme.textTheme.titleMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Builder(
                      builder: (context) {
                        return GestureDetector(
                          onTap: () {
                            TextEditingController nameController =
                                TextEditingController();
                            nameController.text = user.name;
                            Scaffold.of(context).showBottomSheet((context) {
                              return Container(
                                height: 300.h,
                                width: double.infinity,
                                child: Column(
                                  children: [
                                    SizedBox(height: 20.h),
                                    Text('Update Name'),
                                    SizedBox(height: 20.h),

                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 20.w,
                                      ),
                                      child: TextformFieldComponent(
                                        controller: nameController,
                                        hintText: 'Update Name',
                                      ),
                                    ),
                                    SizedBox(height: 20.h),

                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 20.w,
                                      ),
                                      child: ButtonComponent(
                                        hinttext: 'Update',
                                        ontap: () {
                                          final String name = nameController
                                              .text
                                              .trim();
                                          userInfoControler.updateName(
                                            name,
                                            user.name,
                                          );
                                          userInfoControler.fetchUserInfo();
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            });
                          },
                          child: const Icon(Icons.edit_outlined),
                        );
                      },
                    ),
                  ],
                ),

                SizedBox(height: 20.h),

                // Email
                Text(
                  'Email',
                  style: theme.textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: theme.colorScheme.primary,
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: 15.h),
                TextformFieldComponent(
                  enable: false,
                  controller: emailController,
                  hintText: user.email,
                ),

                SizedBox(height: 30.h),

                // About
                Row(
                  children: [
                    Text(
                      'About',
                      style: theme.textTheme.bodyLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                        color: theme.colorScheme.primary,
                        fontSize: 15,
                      ),
                    ),
                    SizedBox(width: 270.w),
                    Builder(
                      builder: (context) {
                        return GestureDetector(
                          onTap: () {
                            aboutController.text = user.about;
                            Scaffold.of(context).showBottomSheet((context) {
                              return Container(
                                height: 300.h,
                                width: double.infinity,
                                child: Column(
                                  children: [
                                    SizedBox(height: 20.h),
                                    Text('Update About'),
                                    SizedBox(height: 20.h),

                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 20.w,
                                      ),
                                      child: TextformFieldComponent(
                                        controller: aboutController,
                                        hintText: 'Update About',
                                      ),
                                    ),
                                    SizedBox(height: 20.h),

                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: 20.w,
                                      ),
                                      child: ButtonComponent(
                                        hinttext: 'Update',
                                        ontap: () {
                                          final String about = aboutController
                                              .text
                                              .trim();
                                          userInfoControler.updateAbout(
                                            about,
                                            user.uid,
                                          );
                                          userInfoControler.fetchUserInfo();
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            });
                          },
                          child: const Icon(Icons.edit_outlined),
                        );
                      },
                    ),
                  ],
                ),

                SizedBox(height: 15.h),
                TextformFieldComponent(
                  enable: false,
                  maxLines: 10,
                  controller: aboutController,
                  hintText: user.about,
                ),

                SizedBox(height: 30.h),
              ],
            ),
          ),
        );
      }),
    );
  }
}
