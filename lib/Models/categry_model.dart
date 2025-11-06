import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  final String? docId;
  final String name;

  CategoryModel({this.docId, required this.name});

  // Convert to Firestore map
  Map<String, dynamic> toFirestore() {
    return {'name': name};
  }

  // ✅ Modified to accept Map instead of DocumentSnapshot
  factory CategoryModel.fromFirestore(Map<String, dynamic> data) {
    return CategoryModel(docId: data['docId'], name: data['name'] ?? '');
  }
}
