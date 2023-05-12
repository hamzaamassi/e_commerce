class SalesModel {
  String saleId;
  String productId;
  String productName;
  int quantity;
  double price;
  double totalPrice;

  SalesModel({
    required this.saleId,
    required this.productId,
    required this.productName,
    required this.quantity,
    required this.price,
    required this.totalPrice,
  });

  factory SalesModel.fromJson(Map<String, dynamic> json) {
    return SalesModel(
      saleId: json['saleId'],
      productId: json['productId'],
      productName: json['productName'],
      quantity: json['quantity'],
      price: json['price'],
      totalPrice: json['totalPrice'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'saleId': saleId,
      'productId': productId,
      'productName': productName,
      'quantity': quantity,
      'price': price,
      'totalPrice': totalPrice,
    };
  }
}
