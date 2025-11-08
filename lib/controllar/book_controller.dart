import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:shoply/models/book_model.dart';

class BookController extends GetxController {
  //categories upload

  Future uploadCategory(String category) async {
    try {
      EasyLoading.show();
      await FirebaseFirestore.instance
          .collection('books')
          .doc(category)
          .set({});
      print('Category uploaded sucessfully');
    } catch (e) {
      print(e.toString());
    } finally {
      EasyLoading.dismiss();
    }
  }

  //upload books
  Future uploadbook(
    title,
    author,
    description,
    imageUrl,
    price,
    category,
    rating,
    pages,
    publishedDate,
  ) async {
    try {
      EasyLoading.show();
      BookModel bookModel = BookModel(
        id: '',
        title: 'title',
        author: 'author',
        description: 'description',
        imageUrl: 'imageUrl',
        price: 'price',
        category: 'category',
        rating: 'rating',
        pages: 'pages',
        publishedDate: publishedDate,
      );
      EasyLoading.show();
      await FirebaseFirestore.instance
          .collection('book')
          .doc()
          .set(bookModel.toMap());
      print('###########################################################');
      print('###########################################################');
      print('###########################################################');
      print('###########################################################');
      print('###########################################################');
      print('###########################################################');
      print('Uploaded sucessfully');
    } catch (e) {
      print(e.toString());
    } finally {
      EasyLoading.dismiss();
    }
  }

  //fetch categories

  Future fetchCategories() async {}

  //fetch books
  Future fetchBooks() async {}
}
