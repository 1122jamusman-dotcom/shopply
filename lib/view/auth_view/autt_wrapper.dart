import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shoply/view/auth_view/login_screen.dart';
import 'package:shoply/view/user_view/home_screen.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // 🔹 Loading state
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }

        // 🔹 User logged in
        if (snapshot.hasData && snapshot.data != null) {
          return const HomeScreen();
        }

        // 🔹 User not logged in
        return LoginScreen();
      },
    );
  }
}
