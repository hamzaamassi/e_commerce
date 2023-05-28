// ignore_for_file: deprecated_member_use

import 'dart:collection';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/features/sales/sale_controller.dart';
import 'package:e_commerce/model/product.dart';
import 'package:e_commerce/model/sale.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

class ProductsController extends GetxController {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final quantityController = TextEditingController();
  final priceController = TextEditingController();
  final imagePicker = ImagePicker();
  File? image;
  final RxList<ProductsModel> products = <ProductsModel>[].obs;
  final RxBool isLoading = true.obs;
  final RxList<SalesModel> sales = <SalesModel>[].obs;
  final RxList<ProductsModel> displayedProducts = <ProductsModel>[].obs;

  int quantityAfterSale = 0;

  @override
  void onInit() {
    super.onInit();
    displayedProducts.value = [];
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    try {
      final snapshot =
          await FirebaseFirestore.instance.collection('product').get();
      products.value = snapshot.docs.map((doc) {
        final data = doc.data();
        return ProductsModel(
          productId: data['productId'],
          name: data['name'],
          quantity: data['quantity'],
          price: data['price'],
          // image: data['image'],
        );
      }).toList();
      displayedProducts.value = List.from(products);

      isLoading.value = false;
    } catch (error) {
      print('Error fetching products: $error');
    }
    isLoading.value = false;
  }

  Future<void> updateProductQuantity(
      String productId, int newQuantity, int saledQuantity) async {
    try {
      await FirebaseFirestore.instance
          .collection('product')
          .doc(productId)
          .update({'quantity': newQuantity});
      final index =
          products.indexWhere((product) => product.productId == productId);
      if (index != -1) {
        products[index].quantity = newQuantity;
        displayedProducts.value = [];
        fetchProducts();
        final _salesController = Get.find<SalesController>();
        _salesController.displayedSales.value = [];
        _salesController.fetchProducts();
      }
    } catch (error) {
      print('Error updating product quantity: $error');
    }
  }

  Future<void> showSalesDialog(
      BuildContext context, ProductsModel product) async {
    int quantity = 1;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Buy ${product.name}'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Enter quantity:'),
              TextFormField(
                keyboardType: TextInputType.number,
                initialValue: quantity.toString(),
                onChanged: (value) => quantity = int.tryParse(value) ?? 1,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a valid quantity';
                  }
                  final parsedValue = int.tryParse(value);
                  if (parsedValue == null || parsedValue <= 0) {
                    return 'Please enter a positive quantity';
                  }
                  return null;
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              child: Text(
                'Cancel',
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF69A03A),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Text(
                'Buy',
              ),
              onPressed: () {
                final double totalPrice = quantity * product.price;
                print(quantity);
                _storeSalesProduct(product.productId, quantity, totalPrice,
                    product.name, product.quantity);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _storeSalesProduct(String productId, int salesQuantity,
      double totalPrice, String productName, productQuantity) async {
    var data = HashMap<String, dynamic>();
    quantityAfterSale = productQuantity - salesQuantity;

    data["productId"] = productId;
    data["name"] = productName;
    data["quantity"] = salesQuantity;
    data["totalPrice"] = totalPrice;
    data["saleId"] = productId;
    data["quantityAfterSale"] = quantityAfterSale;
    data["createdAt"] = FieldValue.serverTimestamp();
    if (quantityAfterSale >= 0) {
      SharedPreferences preferences = await SharedPreferences.getInstance();
      final docRef = await FirebaseFirestore.instance
          .collection('users')
          .doc(preferences.getString('userId'))
          .collection('sales')
          .doc(productId);

      final docSnapshot = await docRef.get();

      int currentQuantity = 0;
      if (docSnapshot.exists) {
        final data = docSnapshot.data() as Map<String, dynamic>;
        currentQuantity = data['quantity'] as int;
        double currentTotalPrice = data['totalPrice'] as double;

        data['quantity'] = currentQuantity + salesQuantity;
        data['totalPrice'] = currentTotalPrice + totalPrice;
        data["quantityAfterSale"] = quantityAfterSale;

        await docRef.set(data, SetOptions(merge: true));
      } else {
        await docRef.set(data);
      }

      Get.back();
      Get.snackbar('Success', 'Sales Successfully');
      updateProductQuantity(
          productId, quantityAfterSale, currentQuantity + salesQuantity);
    } else {
      Toast.show("The Quantity is More than the available! ",
          duration: Toast.lengthShort, gravity: Toast.bottom);
    }
  }

  Future<void> selectImage(ImageSource source) async {
    final pickedFile = await imagePicker.pickImage(source: source);
    if (pickedFile != null) {
      image = File(pickedFile.path);
    }
  }

  void storeProduct() async {
    var data = HashMap<String, dynamic>();
    if (formKey.currentState?.validate() ?? false) {
      final name = nameController.text.trim();
      final salesQuantity = int.parse(quantityController.text.trim());
      final price = double.parse(priceController.text.trim());
      final productId =
          FirebaseFirestore.instance.collection('product').doc().id;

      data["productId"] = productId;
      data["name"] = name;
      data["quantity"] = salesQuantity;
      data["price"] = price;
      data["quantityAfterSale"] = quantityAfterSale;
      // data["image"] = image;
      data["createdAt"] = FieldValue.serverTimestamp();
      await FirebaseFirestore.instance
          .collection('product')
          .doc(productId)
          .set(data);
      Get.back();
      Get.snackbar('Success', 'Success Adding product');

      nameController.clear();
      quantityController.clear();
      priceController.clear();
      fetchProducts();
    }
  }

  void searchProducts(String query) {
    final lowercaseQuery = query.toLowerCase();
    displayedProducts.value = products.where((product) {
      final lowercaseName = product.name.toLowerCase();
      return lowercaseName.contains(lowercaseQuery);
    }).toList();
  }
}
