import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart'as http;
import 'package:flutter/material.dart';
import 'package:net_market/const/api_constants.dart';

import '../models/state_model.dart';
class DeliveryProvider extends ChangeNotifier{
  List<CountryState> countryStates=[];
  Future<List<CountryState>> getstatesbyCountry() async {
    try {
      var body = jsonEncode( {
        "countryId": "${ApiConstants.KUWIT_ID}",
        "addSelectStateItem": true
      });
      var response = await http.post(Uri.parse(
          "${ApiConstants.BASEURL}${ApiConstants.GetStates}"),
          body: body,
          headers: {
            "Accept": "application/json",
            "content-type":"application/json"
          }
      );
      print('Response status: ${response.statusCode}');
      log('Response body: ${response.body.toString()}');
      var data = jsonDecode(response.body.toString());
      List statsTempList = [];
      for (var v in data["Data"]) {
        statsTempList.add(v);
        log(v.toString());
        print(data["Data"].length.toString());
      }
      if (response.statusCode == 200) {
        countryStates =
            CountryState.statsFromSnapshot(statsTempList);
        notifyListeners();
        return countryStates;
      }
    }catch(e){
      log(e.toString());
    }
    throw Exception('Failed to load album');
  }
}