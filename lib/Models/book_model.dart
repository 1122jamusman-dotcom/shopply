class BookModel {
  final String? docId; // Firestore document ID
  final String title;
  final String author;
  final String description;
  final String category;
  final double price;
  final int quantity; // Number of copies available
  final String imageUrl;

  final String address; // Seller or pickup address
  final String condition; // e.g. "New", "Used"
  final bool isSold;
  final DateTime createdAt;

  BookModel({
    this.docId,
    required this.title,
    required this.author,
    required this.description,
    required this.category,
    required this.price,
    required this.quantity,
    required this.imageUrl,

    required this.address,
    required this.condition,
    this.isSold = false,
    required this.createdAt,
  });

  // Convert model to Map (for Firebase upload)
  Map<String, dynamic> toMap() {
    return {
      'docId': docId,
      'title': title,
      'author': author,
      'description': description,
      'category': category,
      'price': price,
      'quantity': quantity,
      'imageUrl': imageUrl,

      'address': address,
      'condition': condition,
      'isSold': isSold,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  // Create model from Firestore snapshot
  factory BookModel.fromMap(Map<String, dynamic> map, String documentId) {
    return BookModel(
      docId: documentId,
      title: map['title'] ?? '',
      author: map['author'] ?? '',
      description: map['description'] ?? '',
      category: map['category'] ?? '',
      price: (map['price'] ?? 0).toDouble(),
      quantity: (map['quantity'] ?? 1).toInt(),
      imageUrl: map['imageUrl'] ?? '',

      address: map['address'] ?? '',
      condition: map['condition'] ?? '',
      isSold: map['isSold'] ?? false,
      createdAt: DateTime.tryParse(map['createdAt'] ?? '') ?? DateTime.now(),
    );
  }
}
