import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/model/sale.dart';
import 'package:flutter/material.dart';

class SalesController with ChangeNotifier {
  final CollectionReference _salesRef =
  FirebaseFirestore.instance.collection('sales');

  List<SalesModel> _sales = [];

  List<SalesModel> get sales => [..._sales];

  Future<void> fetchSales() async {
    try {
      final querySnapshot = await _salesRef.get();
      final docs = querySnapshot.docs.map((doc) => SalesModel.fromJson(doc as Map<String, dynamic>)).toList();
      _sales = docs;
      notifyListeners();
    } catch (error) {
      print(error);
    }
  }

  Future<void> addSale(SalesModel sale) async {
    try {
      await _salesRef.add(sale.toJson());
      _sales.add(sale);
      notifyListeners();
    } catch (error) {
      print(error);
    }
  }

  Future<void> updateSale(SalesModel sale) async {
    try {
      await _salesRef.doc(sale.saleId).update(sale.toJson());
      final index = _sales.indexWhere((s) => s.saleId == sale.saleId);
      if (index >= 0) {
        _sales[index] = sale;
        notifyListeners();
      }
    } catch (error) {
      print(error);
    }
  }

  Future<void> removeSale(String saleId) async {
    try {
      await _salesRef.doc(saleId).delete();
      _sales.removeWhere((s) => s.saleId == saleId);
      notifyListeners();
    } catch (error) {
      print(error);
    }
  }
}
