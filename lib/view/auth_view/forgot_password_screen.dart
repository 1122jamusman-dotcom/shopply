import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/route_manager.dart';
import 'package:shoply/controllar/auth_controllar.dart';
import 'package:shoply/widget/butten_widget.dart';
import 'package:shoply/widget/text_formfield_widget.dart';

class ForgotPasswordScreen extends StatefulWidget {
  ForgotPasswordScreen({super.key});
  final TextEditingController emailcontroller = TextEditingController();
  final AuthController authController = AuthController();

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 13),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 50),
              child: Text(
                'Forgot Password',
                style: theme.textTheme.displayMedium!.copyWith(fontSize: 26),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Forgot your password? Reset it and get back to exploring your bookshelf in seconds.',
              ),
            ),
            SizedBox(height: 20),
            TextFormfieldWidget(
              hintText: 'Email',
              prefixIcon: Icons.mail,
              controllar: widget.emailcontroller,
            ),

            SizedBox(height: 20),
            ButtonWidget(
              hinttext: ' Forgot',
              onTap: () {
                AuthController authControllar = Get.put(AuthController());
                onTap:
                () {
                  final email = widget.emailcontroller.text.trim();

                  if (email.isEmpty) {
                    Get.snackbar('Error', 'Please enter email and password');
                    return;
                  }

                  authControllar.forgotpassword(email);
                };
              },
            ),
          ],
        ),
      ),
    );
  }
}
