import 'dart:io';
import 'package:e_commerce/core/constants.dart';
import 'package:e_commerce/core/widgets/custom_button.dart';
import 'package:e_commerce/core/widgets/custom_text_field.dart';
import 'package:e_commerce/features/product/product_controller.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:e_commerce/model/product.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class AddProductPage extends StatelessWidget {
  final ProductsController controller = Get.find();

  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _quantityController = TextEditingController();
  final _priceController = TextEditingController();
  final _imagePicker = ImagePicker();

  File? _image;

  Future<void> _selectImage(ImageSource source) async {
    final pickedFile = await _imagePicker.pickImage(source: source);
    if (pickedFile != null) {
      _image = File(pickedFile.path);
    }
  }

  void _saveProduct() {
    if (_formKey.currentState?.validate() ?? false) {
      final name = _nameController.text.trim();
      final quantity = int.parse(_quantityController.text.trim());
      final price = double.parse(_priceController.text.trim());
      final productId = UniqueKey().toString();
      final storageRef =
          FirebaseStorage.instance.ref().child('products/$productId');
      if (_image != null) {
        storageRef.putFile(_image!);
        storageRef.putFile(_image!).then((snapshot) {
          snapshot.ref.getDownloadURL().then((imageUrl) {
            final product = ProductsModel(
              productId: productId,
              name: name,
              quantity: quantity,
              price: price,
              image: imageUrl,
            );
            controller.addProduct(product);
            Get.back();
          }).catchError((error) {
            // Handle any errors that occur during the upload process
            print('Error uploading image: $error');
            Get.snackbar('Error', 'Error uploading image');
          });
        });
      } else {
        final product = ProductsModel(
          productId: productId,
          name: name,
          quantity: quantity,
          price: price,
          image: '',
        );
        controller.addProduct(product);
        Get.back();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      appBar: AppBar(
        elevation: 0,
        title: Text('Add Product',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        backgroundColor: mainColor,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter a name';
                  }
                  return null;
                },
                text: 'Product name',
                icon: Icons.label,
                isPasswordType: false,
                textInputAction: TextInputAction.next,
                enable: true,
                keyboardType: TextInputType.name,
              ),
              SizedBox(height: 20),
              CustomTextField(
                controller: _quantityController,
                decoration: InputDecoration(labelText: 'Quantity'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter a quantity';
                  }
                  final quantity = int.tryParse(value!);
                  if (quantity == null || quantity <= 0) {
                    return 'Please enter a valid quantity';
                  }
                  return null;
                },
                text: 'Product quantity',
                textInputAction: TextInputAction.next,
                isPasswordType: false,
                enable: true,
                icon: Icons.numbers,
              ),
              SizedBox(height: 20),
              CustomTextField(
                controller: _priceController,
                decoration: InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                validator: (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Please enter a price';
                  }
                  final price = double.tryParse(value!);
                  if (price == null || price <= 0) {
                    return 'Please enter a valid price';
                  }
                  return null;
                },
                text: 'Product price',
                textInputAction: TextInputAction.done,
                isPasswordType: false,
                enable: true,
                icon: Icons.numbers,
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  TextButton.icon(
                    onPressed: () => _selectImage(ImageSource.camera),
                    icon: Icon(Icons.camera_alt, color: Colors.white),
                    label: Text('Take a photo',
                        style: TextStyle(color: Colors.white)),
                  ),
                  SizedBox(width: 16),
                  TextButton.icon(
                    onPressed: () => _selectImage(ImageSource.gallery),
                    icon: Icon(Icons.image, color: Colors.white),
                    label: Text('Choose from gallery',
                        style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
              SizedBox(height: 16),
              if (_image != null) Image.file(_image!),
              SizedBox(height: 16),
              CustomGeneralButton(
                onTap: _saveProduct,
                text: 'Save',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
