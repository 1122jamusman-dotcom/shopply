import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:shoply/controller/auth_controller.dart';
import 'package:shoply/utils/app_colors.dart';
import 'package:shoply/utils/app_images.dart';
import 'package:shoply/view/auth_view/forgot_password_screen.dart';

import 'package:shoply/widgets/button_component.dart';
import 'package:shoply/widgets/textformfield_component.dart';

// ignore: must_be_immutable
class LoginScreen extends StatefulWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  AuthController authController = AuthController();
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
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
                  child: Text('Sing Ip', style: theme.textTheme.displayMedium),
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
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.to(ForgotPasswordScreen());
                    },
                    child: Text(
                      'Forgot Password?',
                      style: theme.textTheme.bodyLarge,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ButtonComponent(hinttext: 'Signin', ontap: () {}),
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
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 50.h),
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
                      SizedBox(width: 80.w),
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
              SizedBox(height: 200),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 130.h),
                child: Row(
                  children: [
                    Text('Don’t have an account? '),
                    GestureDetector(
                      onTap: () {
                        Get.to(LoginScreen());
                      },
                      child: Text(
                        'Sing up',
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
