import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/model/product.dart';
import 'package:e_commerce/model/sale.dart';
import 'package:get/get.dart';

class SalesController extends GetxController {
  final RxList<SalesModel> sales = <SalesModel>[].obs;
  final RxList<ProductsModel> products = <ProductsModel>[].obs;
  final RxBool isLoading = true.obs;


  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  void removeProduct(String saleId, String productId,int productQuantity,int salesQuantity) {
    FirebaseFirestore.instance.collection('sales').doc(saleId).delete();
    Get.snackbar('Success', 'Deleted Successfully');
    updateProductQuantity(productId, productQuantity + salesQuantity);


  }

  Future<void> fetchProducts() async {
    try {
      final snapshot =
      await FirebaseFirestore.instance.collection('sales').get();
      sales.value = snapshot.docs.map((doc) {
        final data = doc.data();
        return SalesModel(
          productId: data['productId'],
          saleId: data['saleId'],
          productName: data['name'],
          totalPrice: data['totalPrice'],
          quantity: data['quantity'],
          quantityAfterSale: data['quantityAfterSale'],
          // image: data['image'],
        );
      }).toList();
      isLoading.value = false;
    } catch (error) {
      print('Error fetching products: $error');
    }
    isLoading.value = false;
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
