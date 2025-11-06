import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:shoply/Models/categry_model.dart';

class CategoryController extends GetxController {
  var categoryes = <CategoryModel>[].obs;
  Future UploadCategory(category) async {
    try {
      await FirebaseFirestore.instance
          .collection('books')
          .doc(category)
          .set({});

      print('Done');
    } catch (e) {
      print(e.toString());
    }
  }

  Future fetchCategory() async {
    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('books')
          .get();

      categoryes.clear();

      for (var item in snapshot.docs) {
        final data = item.data() as Map<String, dynamic>;
        categoryes.add(CategoryModel.fromFirestore(data));
      }
    } catch (e) {
      print('Error fetching categories: $e');
    }
  }
}
