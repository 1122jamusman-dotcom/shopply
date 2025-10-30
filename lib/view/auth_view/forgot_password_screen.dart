import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shoply/controller/auth_controller.dart';

import 'package:shoply/widgets/button_component.dart';
import 'package:shoply/widgets/textformfield_component.dart';

// ignore: must_be_immutable
class ForgotPasswordScreen extends StatefulWidget {
  TextEditingController emailController = TextEditingController();
  AuthController authController = AuthController();
  ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 13.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10.w, top: 50.h),
              child: Text(
                'Forgot Password',
                style: theme.textTheme.displayMedium,
              ),
            ),
            SizedBox(height: 10.h),
            Padding(
              padding: EdgeInsets.only(left: 10.h),
              child: Text(
                'Forgot your password? Reset it and get back to exploring your bookshelf in seconds.',
              ),
            ),
            SizedBox(height: 20),
            TextformFieldComponent(
              hintText: 'Email',
              controller: widget.emailController,
              prefixIcon: Icons.email_outlined,
            ),
            SizedBox(height: 20.h),
            ButtonComponent(hinttext: 'Forgot', ontap: () {}),
          ],
        ),
      ),
    );
  }
}
