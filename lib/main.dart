import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/instance_manager.dart';
import 'package:shoply/controller/ui_controller/switch_button_controller.dart';
import 'package:shoply/firebase_options.dart';
import 'package:shoply/utils/dark_theme.dart';
import 'package:shoply/utils/light_theme.dart';
import 'package:shoply/view/auth_view/autt_wrapper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(SwitchButtonController());
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final controler = Get.find<SwitchButtonController>();
    return ScreenUtilInit(
      designSize: Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return Obx(() {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: controler.isEnabled.value
                ? ThemeMode.dark
                : ThemeMode.light,
            home: AuthWrapper(),
            builder: EasyLoading.init(),
          );
        });
      },
    );
  }
}
