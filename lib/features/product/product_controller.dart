// ignore_for_file: deprecated_member_use

import 'dart:collection';
import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/model/product.dart';
import 'package:e_commerce/model/sale.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

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
  late final int quantityAfterSale ;

  @override
  void onInit() {
    super.onInit();
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
      final index =
          products.indexWhere((product) => product.productId == productId);
      if (index != -1) {
        products[index].quantity = newQuantity;
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
              child: Text('Cancel'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            ElevatedButton(
              child: Text('Buy'),
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
    final salesId = FirebaseFirestore.instance.collection('sales').doc().id;
    data["productId"] = productId;
    data["name"] = productName;
    data["quantity"] = salesQuantity;
    data["totalPrice"] = totalPrice;
    data["saleId"] = salesId;
    data["quantityAfterSale"] = quantityAfterSale;
    data["createdAt"] =
        FieldValue.serverTimestamp(); // add current date and time
    await FirebaseFirestore.instance.collection('sales').doc(salesId).set(data);
    Get.back();
    Get.snackbar('Success', 'Sales Successfully');
    updateProductQuantity(productId, quantityAfterSale);
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
      // final storageRef =
      //     FirebaseStorage.instance.ref().child('products/$productId');
      // if (image != null) {
      //   storageRef.putFile(image!);
      data["productId"] = productId;
      data["name"] = name;
      data["quantity"] = salesQuantity;
      data["price"] = price;
      data["quantityAfterSale"] = quantityAfterSale;
      // data["image"] = image;
      data["createdAt"] =
          FieldValue.serverTimestamp(); // add current date and time
      await FirebaseFirestore.instance
          .collection('product')
          .doc(productId)
          .set(data);
      Get.back();
      Get.snackbar('Success', 'Success Adding product',backgroundColor: Colors.white  );
      // } else {
      //   data["productId"] = productId;
      //   data["name"] = name;
      //   data["salesQuantity"] = salesQuantity;
      //   data["price"] = price;
      //   // data["image"] = ' ';
      //   data["createdAt"] =
      //       FieldValue.serverTimestamp(); // add current date and time
      //   await FirebaseFirestore.instance
      //       .collection('product')
      //       .doc(productId)
      //       .set(data);
      //   Get.back();
      //   Get.snackbar('Success', 'Success Adding product');
      // }
      nameController.clear();
      quantityController.clear();
      priceController.clear();
    }
  }
}
