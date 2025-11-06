import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class BookController extends GetxController {
  //categories upload

  Future uploadCategory(String category) async {
    try {
      EasyLoading.show();
      await FirebaseFirestore.instance
          .collection('books')
          .doc(category)
          .set({});
      print('CAtegory uploaded sucessfully');
    } catch (e) {
      print(e.toString());
    } finally {
      EasyLoading.dismiss();
    }
  }

  //upload books
  Future uploadBook() async {}

  //fetch categories

  Future fetchCategories() async {}

  //fetch books
  Future fetchBooks() async {}
}
