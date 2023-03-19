// ignore_for_file: public_member_api_docs, sort_constructors_first

class ProductModel {
  final String id;
  final String price;
  final String? discountValue;
  final String title;
  final String imageUrl;
  final String category;
  final String? rating;
  ProductModel({
    required this.id,
    required this.price,
    required this.title,
    required this.imageUrl,
    this.discountValue,
    this.category = 'Other',
    this.rating,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'price': price,
      'discountValue': discountValue,
      'title': title,
      'imageUrl': imageUrl,
      'category': category,
      'rating': rating,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map, String documentId) {
    return ProductModel(
      id: documentId,
      price: map['price'] as String,
      discountValue:
          map['discountValue'] != null ? map['discountValue'] as String : null,
      title: map['title'] as String,
      imageUrl: map['imageUrl'] as String,
      category: map['category'] as String,
      rating: map['rating'] != null ? map['rating'] as String : null,
    );
  }

  @override
  bool operator ==(covariant ProductModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.price == price &&
        other.discountValue == discountValue &&
        other.title == title &&
        other.imageUrl == imageUrl &&
        other.category == category &&
        other.rating == rating;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        price.hashCode ^
        discountValue.hashCode ^
        title.hashCode ^
        imageUrl.hashCode ^
        category.hashCode ^
        rating.hashCode;
  }
}
