class SalesModel {
  String saleId;
  String productId;
  String productName;
  int quantity;
  double totalPrice;
  int quantityAfterSale;

  SalesModel({
    required this.saleId,
    required this.productId,
    required this.productName,
    required this.quantity,
    required this.totalPrice,
    required this.quantityAfterSale,
  });

  factory SalesModel.fromMap(Map<String, dynamic> map) {
    return SalesModel(
      saleId: map['saleId'],
      productId: map['productId'],
      productName: map['name'],
      quantity: map['quantity'],
      totalPrice: map['totalPrice'],
      quantityAfterSale: map['quantityAfterSale'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'saleId': saleId,
      'productId': productId,
      'name': productName,
      'quantity': quantity,
      'price': totalPrice,
      'quantityAfterSale': quantityAfterSale,
    };
  }
}
