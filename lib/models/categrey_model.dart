import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  final String? docId;
  final String name;
  CategoryModel({this.docId, required this.name});
  // Convert to Firestore map
  Map<String, dynamic> toFirestore() {
    return {'name': name};
  }

  // Create from Firestore snapshot
  factory CategoryModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return CategoryModel(docId: snapshot.id, name: data?['name'] ?? '');
  }
}
