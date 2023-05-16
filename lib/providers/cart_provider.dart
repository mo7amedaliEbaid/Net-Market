import 'package:flutter/material.dart';
import 'package:net_market/models/productinCategoryList_model.dart';
class CartProvider extends ChangeNotifier {
  List<ProductbyCategory> listProduct = [];
  // String urlApi = ''

  void add(ProductbyCategory item, int quantity) {
    for (int i = 0; i < listProduct.length; i++) {
      if (listProduct[i].name == item.name) {
        listProduct[i].quantity = listProduct[i].quantity + quantity;
        notifyListeners();
        return;
      }
    }
    ProductbyCategory product = ProductbyCategory.fromItem(item, 1);
    listProduct.add(product);
    notifyListeners();
  }

  void updateQuantity(ProductbyCategory product, int newQuantity) {
    for (int i = 0; i < listProduct.length; i++) {
      if (listProduct[i].name == product.name) {
        listProduct[i].quantity = newQuantity;
        if (newQuantity == 0) remove(product);
        notifyListeners();
        return;
      }
    }
  }

  double totalPrice() {
    double total = 0;
    for (ProductbyCategory product in listProduct) {
      total += (product.price!* product.quantity);
    }
    return total;
  }

  void remove(ProductbyCategory item) {
    listProduct.remove(item);
    notifyListeners();
  }
}