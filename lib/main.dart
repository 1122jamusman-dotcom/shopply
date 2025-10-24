import 'package:flutter/material.dart';
import 'package:shoply/utils/theme_data.dart';
import 'package:shoply/view/auth_view/forgot_password_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: ForgotPasswordScreen(),
    );
  }
}
