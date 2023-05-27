class ProductsModel {
  final String productId;
  final String name;
  int quantity;
  final double price;
  // final String image;

  ProductsModel({
    required this.productId,
    required this.name,
    required this.quantity,
    required this.price,
    // required this.image,
  });

  factory ProductsModel.fromMap(Map<String, dynamic> map) {
    return ProductsModel(
      productId: map['productId'],
      name: map['name'],
      quantity: map['quantity'],
      price: map['price'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'productId': productId,
      'name': name,
      'quantity': quantity,
      'price': price,
    };
  }
}
