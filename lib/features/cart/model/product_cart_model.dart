
class ProductCartModel {
  final String id;
  final int price;
  final String title;
  final String imageUrl;
  int quantity;
  final String color;
  final String size;

  ProductCartModel({
    required this.id,
    required this.price,
    required this.title,
    required this.imageUrl,
    required this.color,
    required this.size,
    this.quantity = 1,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'price': price,
      'title': title,
      'imageUrl': imageUrl,
      'quantity': quantity,
      'color': color,
      'size': size,
    };
  }

  factory ProductCartModel.fromMap(Map<String, dynamic> map, String id) {
    return ProductCartModel(
      id: id,
      price: map['price'] as int,
      title: map['title'] as String,
      imageUrl: map['imageUrl'] as String,
      quantity: map['quantity'] as int,
      color: map['color'] as String,
      size: map['size'] as String,
    );
  }
}
