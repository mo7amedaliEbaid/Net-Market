import 'dart:convert';
import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:net_market/const/api_constants.dart';
import 'package:net_market/models/product_model.dart';

class SearchProvider extends ChangeNotifier {
  List<Product> productListBySearch=[];

  Future<List<Product>> getproductListBySearch(String searchvalue) async {
    try {
      var body = jsonEncode( {
        "storeId": "${ApiConstants.STOREID}",
        "search": "${searchvalue}",
        "pageIndex": 1,
        "pageSize": 10
      });
      var response = await http.post(Uri.parse(
          "${ApiConstants.BASEURL}${ApiConstants.GETSEARCHRESULTS}"),
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
        productListBySearch =
            Product.productsbyCatFromSnapshot(productTempList);
        notifyListeners();
        return productListBySearch;
      }
    }catch(e){
      log(e.toString());
    }
    throw Exception('Failed to load album');
  }
}
