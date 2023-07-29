import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:net_market/const/api_constants.dart';
import 'package:net_market/models/store_model.dart';
import 'package:http/http.dart'as http;
class StoreProvider extends ChangeNotifier{
  Store store=Store();
  Future<Store> getstore() async {
    try {
      var response = await http.get(Uri.parse("${ApiConstants.BASEURL}${ApiConstants.STORE}"));
      print("response ${jsonDecode(response.body)}");
      var data = jsonDecode(response.body);
      if (response.statusCode != 200) {
        throw data["message"];
      }
      store=Store.fromJson(data["Data"]);
      notifyListeners();
      return store;
    } catch (error) {
      log("an error occured while getting product info $error");
      throw error.toString();
    }
  }
}