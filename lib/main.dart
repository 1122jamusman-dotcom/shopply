import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shoply/utils/theme_data.dart';
import 'package:shoply/view/auth_view/favourites_screen.dart';
import 'package:shoply/view/auth_view/peofile_screen.dart';
import 'package:shoply/view/upload_category.dart';
import 'package:shoply/view/uploads_books.dart';
import 'package:shoply/widgats/textfaom_widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: ProfileScreen(),
    );
  }
}
