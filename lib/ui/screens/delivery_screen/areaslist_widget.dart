import 'package:flutter/material.dart';
import 'package:net_market/providers/delivery_provider.dart';
import 'package:provider/provider.dart';
Widget buildAreasList(bool isloading){
  return Consumer<DeliveryProvider>(builder: (context,data,_){
    return /*isloading?Center(child: CircularProgressIndicator()):*/ListView.builder(
        shrinkWrap: true,
        itemCount: data.stateAreas.length,
        itemBuilder: (context,index){
      return
        Text(data.stateAreas[index].name!);
    });
  });

}