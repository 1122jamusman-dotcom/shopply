import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:shoply/Models/user_info_model.dart';

class UserInfoControler extends GetxController {
  var userInfo = Rxn<UserInfoModel>(); // reactive variable

  /// Store user info to Firestore
  Future storeUserInfo(String name, String email) async {
    String uid = FirebaseAuth.instance.currentUser!.uid;

    UserInfoModel user = UserInfoModel(
      uid: uid,
      name: name,
      email: email,
      phone: 'phone',
      gender: 'male',
      profileImage:
          'https://cdn.vectorstock.com/i/500p/29/52/faceless-male-avatar-in-hoodie-vector-56412952.jpg',
      dateOfBirth: '2008-11-2',
      joinedAt: DateTime.now().toString(),
      userType: 'user',
      about:
          'Anas is a passionate author and storyteller who blends emotion, philosophy, and real-life experiences into his writing.',
    );

    try {
      await FirebaseFirestore.instance
          .collection('userInfo')
          .doc(uid)
          .set(user.toJson());
    } catch (e) {
      print("Error storing user info: $e");
    }
  }

  Future updateName(String name, String docId) async {
    try {
      EasyLoading.show();
      String uid = FirebaseAuth.instance.currentUser!.uid;
      await FirebaseFirestore.instance.collection('userInfo').doc(uid).update({
        "name": name,
      });
    } catch (e) {
      print("Error fetching user info: $e");
    } finally {
      EasyLoading.dismiss();
    }
  }

  Future updateAbout(String about, String docId) async {
    try {
      EasyLoading.show();
      String uid = FirebaseAuth.instance.currentUser!.uid;
      await FirebaseFirestore.instance.collection('userInfo').doc(uid).update({
        "about": about,
      });
    } catch (e) {
      print("Error fetching user info: $e");
    } finally {
      EasyLoading.dismiss();
    }
  }

  /// Fetch user info and update reactive variable
  Future<void> fetchUserInfo() async {
    try {
      String uid = FirebaseAuth.instance.currentUser!.uid;
      DocumentSnapshot doc = await FirebaseFirestore.instance
          .collection('userInfo')
          .doc(uid)
          .get();

      if (doc.exists) {
        userInfo.value = UserInfoModel.fromJson(
          doc.data() as Map<String, dynamic>,
        );
      } else {
        print("No user info found");
      }
    } catch (e) {
      print("Error fetching user info: $e");
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchUserInfo(); // auto-fetch when controller is created
  }
}
