import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/model/product.dart';
import 'package:e_commerce/model/sale.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SalesController extends GetxController {
  final RxList<SalesModel> sales = <SalesModel>[].obs;
  final RxList<ProductsModel> products = <ProductsModel>[].obs;
  final RxBool isLoading = true.obs;
  final RxList<SalesModel> displayedSales = <SalesModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    displayedSales.value = [];
    fetchProducts();
  }

  void removeProduct(String saleId, String productId, int productQuantity,
      int salesQuantity) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    FirebaseFirestore.instance
        .collection('users')
        .doc(preferences.getString('userId'))
        .collection('sales')
        .doc(productId)
        .delete();
    Get.snackbar('Success', 'Deleted Successfully');
    updateProductQuantity(productId, productQuantity + salesQuantity);
  }

  Future<void> fetchProducts() async {
    try {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      final salesSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(preferences.getString('userId'))
          .collection('sales')
          .get();

      sales.value = salesSnapshot.docs.map((doc) {
        final data = doc.data();
        return SalesModel(
          saleId: doc.id,
          productId: data['productId'],
          productName: data['name'],
          quantity: data['quantity'],
          totalPrice: data['totalPrice'],
          quantityAfterSale: data['quantityAfterSale'],
        );
      }).toList();
      displayedSales.value = sales; // Initialize displayedSales with all sales

      isLoading.value = false;
    } catch (error) {
      print('Error fetching products: $error');
    }
    isLoading.value = false;
  }

  void searchSales(String query) {
    if (query.isEmpty) {
      displayedSales.value =
          sales; // Show all sales if the search query is empty
    } else {
      final lowercaseQuery = query.toLowerCase();
      displayedSales.value = sales
          .where(
              (sale) => sale.productName.toLowerCase().contains(lowercaseQuery))
          .toList();
    }
  }

  Future<void> updateProductQuantity(String productId, int newQuantity) async {
    try {
      await FirebaseFirestore.instance
          .collection('product')
          .doc(productId)
          .update({'quantity': newQuantity});
      final productIndex =
          products.indexWhere((product) => product.productId == productId);
      if (productIndex != -1) {
        products[productIndex].quantity = newQuantity;
      }
    } catch (error) {
      print('Error updating product quantity: $error');
    }
  }
}
