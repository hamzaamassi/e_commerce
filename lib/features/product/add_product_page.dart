import 'package:e_commerce/core/constants.dart';
import 'package:e_commerce/core/widgets/custom_button.dart';
import 'package:e_commerce/core/widgets/custom_text_field.dart';
import 'package:e_commerce/features/product/product_controller.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddProductPage extends GetView<ProductsController> {
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
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextField(
                controller: controller.nameController,
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
                controller: controller.quantityController,
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
                controller: controller.priceController,
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
                    onPressed: () => controller.selectImage(ImageSource.camera),
                    icon: Icon(Icons.camera_alt, color: Colors.white),
                    label: Text('Take a photo',
                        style: TextStyle(color: Colors.white)),
                  ),
                  SizedBox(width: 16),
                  TextButton.icon(
                    onPressed: () =>
                        controller.selectImage(ImageSource.gallery),
                    icon: Icon(Icons.image, color: Colors.white),
                    label: Text('Choose from gallery',
                        style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
              SizedBox(height: 16),
              if (controller.image != null) Image.file(controller.image!),
              SizedBox(height: 16),
              CustomGeneralButton(
                onTap: controller.storeProduct,
                text: 'Save',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
