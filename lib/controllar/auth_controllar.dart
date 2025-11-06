import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:shoply/controllar/user_%20information%20_controllar.dart';
import 'package:shoply/view/auth_view/login_screen.dart';
import 'package:shoply/view/auth_view/singup_screen.dart';
import 'package:shoply/view/user_view/home_screen.dart';

class AuthController extends GetxController {
  // signup
  Future signup(String email, String password, String name) async {
    try {
      UserInfoControler userInfoControler = Get.put(UserInfoControler());
      EasyLoading.show();

      /// signUp
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      /// Storing data
      userInfoControler.storeUserInfo(name, email);
      Get.offAll(() => HomeScreen());
      //
    } catch (e) {
      GetSnackBar(message: e.toString());
    } finally {
      EasyLoading.dismiss();
    }
  }

  //login
  Future login(String email, String password) async {
    try {
      EasyLoading.show();
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      Get.offAll(() => HomeScreen());
      //
    } catch (e) {
      Get.showSnackbar(GetSnackBar(message: e.toString()));
    } finally {
      EasyLoading.dismiss();
    }
  }

  //logout
  Future logout() async {
    //
    try {
      //
      EasyLoading.show();
      //
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => LoginScreen());
      //
    } catch (e) {
      GetSnackBar(message: e.toString());
    } finally {
      EasyLoading.dismiss();
    }
  }

  //auth check
  Future authCheck() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      Get.offAll(() => HomeScreen());
    } else {
      Get.offAll(() => LoginScreen());
    }
  }

  // forgotpassword
  Future forgotpassword(String email) async {
    try {
      EasyLoading.show();
      //
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      Get.off(SingUpScreen());
    } catch (e) {
      GetSnackBar(message: e.toString());
      print(e.toString());
    } finally {
      EasyLoading.dismiss();
    }
  }
}
