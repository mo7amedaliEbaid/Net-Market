import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart'as http;
import 'package:flutter/material.dart';
import 'package:net_market/const/api_constants.dart';
import 'package:net_market/models/area_model.dart';
import 'package:net_market/models/branch_model.dart';

import '../models/state_model.dart';
class DeliveryProvider extends ChangeNotifier{
  List<CountryState> countryStates=[];
  List<StateArea> stateAreas=[];
  List<Branch> brancheslist=[];
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
  Future<List<StateArea>> getareasbyState(String stateId) async {
    try {
      var body = jsonEncode( {
        "stateId": "${stateId}",
        "addSelectStateItem": false,
        "getAll": true
      });
      var response = await http.post(Uri.parse(
          "${ApiConstants.BASEURL}${ApiConstants.GetAreas}"),
          body: body,
          headers: {
            "Accept": "application/json",
            "content-type":"application/json"
          }
      );
      print('Response status: ${response.statusCode}');
      log('Response body: ${response.body.toString()}');
      var data = jsonDecode(response.body.toString());
      List areasTempList = [];
      for (var v in data["Data"]) {
        areasTempList.add(v);
        log(v.toString());
        print(data["Data"].length.toString());
      }
      if (response.statusCode == 200) {
        stateAreas =
            StateArea.areasFromSnapshot(areasTempList);
        notifyListeners();
        return stateAreas;
      }
    }catch(e){
      log(e.toString());
    }
    throw Exception('Failed to load album');
  }
  Future<List<Branch>> getbranchesbyStoreId() async {
    try {
      var response = await http.get(Uri.parse(
          "${ApiConstants.BASEURL}${ApiConstants.GET_BRANCHES}${ApiConstants.STOREID}"),
      );
      print('Response status: ${response.statusCode}');
      log('Response body: ${response.body.toString()}');
      var data = jsonDecode(response.body.toString());
      List branchesTempList = [];
      for (var v in data["Data"]) {
        branchesTempList.add(v);
        log(v.toString());
        print(data["Data"].length.toString());
      }
      if (response.statusCode == 200) {
        brancheslist =
            Branch.branchesFromSnapshot(branchesTempList);
        notifyListeners();
        return brancheslist;
      }
    }catch(e){
      log(e.toString());
    }
    throw Exception('Failed to load album');
  }
}