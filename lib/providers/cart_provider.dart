import 'package:flutter/material.dart';
import 'package:net_market/models/product_model.dart';
class CartProvider extends ChangeNotifier {
  List<Product> listProduct = [];
  // String urlApi = ''

  void add(Product item, int quantity) {
    for (int i = 0; i < listProduct.length; i++) {
      if (listProduct[i].name == item.name) {
        listProduct[i].quantity = listProduct[i].quantity + quantity;
        notifyListeners();
        return;
      }
    }
    Product product = Product.fromItem(item, 1);
    listProduct.add(product);
    notifyListeners();
  }

  void updateQuantity(Product product, int newQuantity) {
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
    for (Product product in listProduct) {
      total += (product.price!* product.quantity);
    }
    return total;
  }

  void remove(Product item) {
    listProduct.remove(item);
    notifyListeners();
  }
}