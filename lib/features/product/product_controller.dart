// ignore_for_file: deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/model/product.dart';
import 'package:get/get.dart';
import 'package:firebase_database/firebase_database.dart';

class ProductsController extends GetxController {
  late DatabaseReference _productsRef;
  final CollectionReference _productsCollection =
      FirebaseFirestore.instance.collection('products');
  final RxList<ProductsModel> products = <ProductsModel>[].obs;
  final RxBool isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    _productsRef = FirebaseDatabase.instance.reference().child('products');
    fetchProducts();
  }

  void removeProduct(String productId) {
    // Remove the product from Firebase
    _productsRef.child(productId).remove();
  }

  Future<void> fetchProducts() async {
    try {
      final snapshot = await _productsCollection.get();
      products.value = snapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return ProductsModel(
          productId: doc.id,
          name: data['name'],
          quantity: data['quantity'],
          price: data['price'],
          image: data['image'],
        );
      }).toList();
      isLoading.value = false;
    } catch (error) {
      print('Error fetching products: $error');
    }
  }

  Future<void> addProduct(ProductsModel product) async {
    try {
      await _productsCollection.add(product.toJson());
    } catch (error) {
      print('Error adding product: $error');
    }
  }

  Future<void> updateProductQuantity(String productId, int newQuantity) async {
    try {
      final docRef = _productsCollection.doc(productId);
      await docRef.update({'quantity': newQuantity});
      final index =
          products.indexWhere((product) => product.productId == productId);
      if (index != -1) {
        products[index].quantity = newQuantity;
      }
    } catch (error) {
      print('Error updating product quantity: $error');
    }
  }
}
