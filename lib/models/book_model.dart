class BookModel {
  final String id;
  final String title;
  final String author;
  final String description;
  final String imageUrl;
  final double price;
  final String category;
  final double rating;
  final int pages;
  final DateTime publishedDate;

  BookModel({
    required this.id,
    required this.title,
    required this.author,
    required this.description,
    required this.imageUrl,
    required this.price,
    required this.category,
    required this.rating,
    required this.pages,
    required this.publishedDate,
  });

  // Convert BookModel to Map (for Firebase / JSON)
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'author': author,
      'description': description,
      'imageUrl': imageUrl,
      'price': price,
      'category': category,
      'rating': rating,
      'pages': pages,
      'publishedDate': publishedDate.toIso8601String(),
    };
  }

  // Create BookModel from Map (for Firebase / JSON)
  factory BookModel.fromMap(Map<String, dynamic> map) {
    return BookModel(
      id: map['id'] ?? '',
      title: map['title'] ?? '',
      author: map['author'] ?? '',
      description: map['description'] ?? '',
      imageUrl: map['imageUrl'] ?? '',
      price: (map['price'] ?? 0).toDouble(),
      category: map['category'] ?? '',
      rating: (map['rating'] ?? 0).toDouble(),
      pages: map['pages'] ?? 0,
      publishedDate:
          DateTime.tryParse(map['publishedDate'] ?? '') ?? DateTime.now(),
    );
  }
}
