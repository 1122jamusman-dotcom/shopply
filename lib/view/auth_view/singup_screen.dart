import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';

import 'package:shoply/controller/feature_controller/auth_controller.dart';
import 'package:shoply/utils/app_colors.dart';
import 'package:shoply/utils/app_images.dart';
import 'package:shoply/view/auth_view/login_screen.dart';

import 'package:shoply/widgets/button_component.dart';
import 'package:shoply/widgets/textformfield_component.dart';

// ignore: must_be_immutable
class SingUpScreen extends StatefulWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  AuthController authController = AuthController();
  SingUpScreen({super.key});

  @override
  State<SingUpScreen> createState() => _SingUpScreenState();
}

class _SingUpScreenState extends State<SingUpScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 13.h),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10.w),
                child: Padding(
                  padding: EdgeInsets.only(top: 50.h),
                  child: Text(
                    'Sing Up',
                    style: theme.textTheme.headlineLarge!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text(
                  'Join our community of book lovers. Create an account and start your reading journey today.',
                ),
              ),
              SizedBox(height: 20.h),
              TextformFieldComponent(
                prefixIcon: Icons.person_2_outlined,
                hintText: 'Name',
                controller: widget.nameController,
              ),
              SizedBox(height: 20.h),

              TextformFieldComponent(
                hintText: 'Email',

                controller: widget.emailController,
                prefixIcon: Icons.email_outlined,
              ),

              SizedBox(height: 16.h),
              TextformFieldComponent(
                controller: widget.passwordController,
                hintText: 'Password',
                prefixIcon: Icons.lock_outlined,
                suffixIcon: Icons.remove_red_eye_outlined,
              ),

              SizedBox(height: 30.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ButtonComponent(
                  hinttext: 'Signup',
                  ontap: () {
                    print('object');
                    widget.authController.signup(
                      widget.emailController.text.trim(),
                      widget.passwordController.text.trim(),
                      widget.nameController.text.trim(),
                    );
                  },
                ),
              ),
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.h),
                        child: Divider(),
                      ),
                    ),
                    Text('Or'),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.h),
                        child: Divider(),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 40.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: Container(
                  height: 50.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.background,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10.h),
                        child: SvgPicture.asset(AppImages.googleLogo),
                      ),
                      SizedBox(width: 50.w),
                      Text(
                        'Sing in with Google',
                        style: theme.textTheme.titleSmall!.copyWith(
                          color: theme.colorScheme.primary,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 220.h),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 55.h),
                child: Row(
                  children: [
                    Text('Already have an account?'),
                    GestureDetector(
                      onTap: () {
                        Get.to(LoginScreen());
                      },
                      child: Text(
                        'Sing In',
                        style: theme.textTheme.bodyLarge!.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
