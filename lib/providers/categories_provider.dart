import 'dart:convert';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:net_market/const/api_constants.dart';
import 'package:net_market/models/category_model.dart';
import 'package:net_market/models/product_model.dart';


class CategoriesProvider extends ChangeNotifier {
  List<MainCategory> maincategories = [];
  List<Product> productListByCategory=[];

  Future<List<MainCategory>> getallcategories() async {
    var response = await http.get(Uri.parse(
        "${ApiConstants.BASEURL}${ApiConstants.GETCATEGORY}${ApiConstants.STOREID}"));
    print('Response status: ${response.statusCode}');
    log('Response body: ${response.body}');
    var data = jsonDecode(response.body);
    List catsTempList = [];
    for (var v in data["Data"]) {
      catsTempList.add(v);
      log(v.toString());
      print(data["Data"].length.toString());
    }
    if (response.statusCode == 200) {
      maincategories = MainCategory.catsFromSnapshot(catsTempList);

      notifyListeners();
      return maincategories;
    } else {
      throw Exception('Failed to load album');
    }
  }
  Future<List<Product>> getproductListByCategory(String categoryId) async {
    try {
      var body = jsonEncode( {
        "categoryId": "${categoryId}"
      });
      var response = await http.post(Uri.parse(
          "${ApiConstants.BASEURL}${ApiConstants.GETCATEGORYLIST}"),
          body: body,
          headers: {
            "Accept": "application/json",
            "content-type":"application/json"
          }
      );
      print('Response status: ${response.statusCode}');
      log('Response body: ${response.body.toString()}');
      var data = jsonDecode(response.body.toString());
      List productTempList = [];
      for (var v in data["Data"]) {
        productTempList.add(v);
        log(v.toString());
        print(data["Data"].length.toString());
      }
      if (response.statusCode == 200) {
        productListByCategory =
            Product.productsbyCatFromSnapshot(productTempList);
        notifyListeners();
        return productListByCategory;
      }
    }catch(e){
      log(e.toString());
    }
    throw Exception('Failed to load album');
  }
}
