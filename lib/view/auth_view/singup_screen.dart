import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shoply/controllar/auth_controllar.dart';
import 'package:shoply/utils/app_colors.dart';
import 'package:shoply/utils/app_images.dart';
import 'package:shoply/widget/butten_widget.dart';
import 'package:shoply/widget/text_formfield_widget.dart';

// ignore: must_be_immutable
class SingUpScreen extends StatefulWidget {
  AuthController authControllar = Get.put(AuthController());
  SingUpScreen({super.key});

  @override
  State<SingUpScreen> createState() => _SingUpScreenState();
}

class _SingUpScreenState extends State<SingUpScreen> {
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController passwordControelr = TextEditingController();
  TextEditingController nameControelr = TextEditingController();
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
                  padding: const EdgeInsets.only(top: 50),
                  child: Text('Sing Up', style: theme.textTheme.displayMedium),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: EdgeInsets.only(left: 10.w),
                child: Text(
                  'Join our community of book lovers. Create an account and start your reading journey today.',
                ),
              ),
              TextFormfieldWidget(hintText: 'Name', controllar: nameControelr),

              SizedBox(height: 5.h),
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
              ),

              SizedBox(height: 20.h),
              ButtonWidget(
                hinttext: ' Sing Up',
                onTap: () {
                  final email = emailcontroller.text.trim();
                  final password = passwordControelr.text.trim();

                  if (email.isEmpty || password.isEmpty) {
                    Get.snackbar('Error', 'Please enter email and password');
                    return;
                  }

                  widget.authControllar.signup(
                    emailcontroller.text.trim(),
                    passwordControelr.text.trim(),
                    nameControelr.text.trim(),
                  );
                },
              ),
              SizedBox(height: 20),
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
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Container(
                  height: 50,
                  width: 360,
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
              SizedBox(height: 300.h),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 70.w),
                child: Row(
                  children: [
                    Text('Already have an account?'),
                    Text(
                      'Sing In',
                      style: theme.textTheme.bodyLarge!.copyWith(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
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
