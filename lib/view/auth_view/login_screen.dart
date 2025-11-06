import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shoply/controllar/auth_controllar.dart';
import 'package:shoply/utils/app_colors.dart';
import 'package:shoply/utils/app_images.dart';
import 'package:shoply/view/auth_view/singup_screen.dart';

import 'package:shoply/widget/butten_widget.dart';
import 'package:shoply/widget/text_formfield_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passwordControelr = TextEditingController();
  final AuthController authControllar = Get.put(AuthController());
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 13.w),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10.w),
                child: Padding(
                  padding: EdgeInsets.only(top: 50.h),
                  child: Text('Sing in', style: theme.textTheme.displayMedium),
                ),
              ),
              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.only(left: 10.w),
                child: Text(
                  'Discover your next favorite read. Sign in and dive into a world of books you’ll love.',
                ),
              ),
              SizedBox(height: 20.h),
              TextFormfieldWidget(
                hintText: 'Email',
                prefixIcon: Icons.email,
                controllar: emailcontroller,
              ),
              SizedBox(height: 5.h),
              TextFormfieldWidget(
                hintText: 'Password',
                prefixIcon: Icons.lock,
                controllar: passwordControelr,
                suffixIcon: Icons.visibility,
                isPassword: true,
              ),
              SizedBox(height: 10.h),
              Padding(
                padding: EdgeInsets.only(left: 270.w),
                child: Text(
                  'Forgot Password?',
                  style: theme.textTheme.bodyMedium,
                ),
              ),
              SizedBox(height: 20.h),
              ButtonWidget(
                hinttext: ' Sing in',

                onTap: () {
                  final email = emailcontroller.text.trim();
                  final password = passwordControelr.text.trim();

                  if (email.isEmpty || password.isEmpty) {
                    Get.snackbar('Error', 'Please enter email and password');
                    return;
                  }

                  authControllar.login(email, password);
                },
              ),
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Divider(),
                      ),
                    ),
                    Text('Or'),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Divider(),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: Container(
                  height: 50.h,
                  width: 360.w,
                  decoration: BoxDecoration(
                    color: AppColors.background,
                    borderRadius: BorderRadius.circular(10.r),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 10.w),
                        child: Image.asset(AppImages.onbording2),
                      ),
                      SizedBox(width: 70.w),
                      Text(
                        'Sing in with Google',
                        style: theme.textTheme.bodyMedium!.copyWith(
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 250.h),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 70.w),
                child: Row(
                  children: [
                    Text('Don\'t have an account?'),
                    GestureDetector(
                      onTap: () {
                        Get.to(SingUpScreen());
                      },
                      child: Text(
                        'Sign up',
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
