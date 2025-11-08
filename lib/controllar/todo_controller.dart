import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class TodoControllar extends GetxController {
  // List<TodoModel> todos = <TodoModel>[].obs;
  final String userId = FirebaseAuth.instance.currentUser!.uid;

  //add todo
  Future addTodo(String title, String description, BuildContext context) async {
    try {
      EasyLoading.show();

      DocumentReference docRef = FirebaseFirestore.instance
          .collection('todos')
          .doc();
      await docRef.set({
        'title': title,
        'description': description,
        'docId': docRef.id,
        'userId': userId,
      });
      Navigator.pop(context);
    } catch (e) {
      print(
        '#####################################################################',
      );
      print(e.toString());
      Fluttertoast.showToast(msg: e.toString());
    } finally {
      EasyLoading.dismiss();
    }
  }

  //update todo
  Future updateTodo(
    String title,
    String description,
    BuildContext context,
    String docId,
  ) async {
    try {
      EasyLoading.show();
      await FirebaseFirestore.instance.collection('todos').doc(docId).update({
        'title': title,
        'description': description,
      });
      Navigator.pop(context);
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    } finally {
      EasyLoading.dismiss();
    }
  }

  // delete todo
  Future delete(String docId) async {
    try {
      EasyLoading.show();

      FirebaseFirestore.instance.collection('todos').doc(docId).delete();
    } catch (e) {
      Fluttertoast.showToast(msg: e.toString());
    } finally {
      EasyLoading.dismiss();
    }
  }

  /// fetch todo
  Future fetchTodo() async {
    try {
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection('todos')
          .where('userId', isEqualTo: userId)
          .get();
      // todos.clear();

      for (var items in snapshot.docs) {
        final data = items.data() as Map<String, dynamic>;
        // todos.add(TodoModel.fromMap(data));
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
