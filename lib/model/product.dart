class ProductsModel {
  final String productId;
  final String name;
  late final int quantity;
  final double price;
  final String image;

  ProductsModel({
    required this.productId,
    required this.name,
    required this.quantity,
    required this.price,
    required this.image,
  });

  Map<String, dynamic> toJson() {
    return {
      'productId': productId,
      'name': name,
      'quantity': quantity,
      'price': price,
      'image': image,
    };
  }
}
