import 'package:flutter/material.dart';
import 'package:net_market/const/global_constants.dart';
import 'package:net_market/providers/delivery_provider.dart';
import 'package:provider/provider.dart';

Widget buildAreasList(bool isloading) {
  bool istapped=false;
  return Consumer<DeliveryProvider>(builder: (context, data, _) {
    return isloading
        ? Center(child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: CircularProgressIndicator(strokeWidth: 3,),
        ))
        : ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: data.stateAreas.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(10, 18.0,0,10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    StatefulBuilder(builder: (context,setState){
                      return  InkWell(
                        onTap: (){
                          setState((){
                            istapped = !istapped;
                          });
                        },
                        child: Container(
                          height: 25,
                          width: 25,
                          decoration: !istapped ?
                          BoxDecoration(
                            border: Border.all(color: Colors.lightGreen,width: 2),
                            shape: BoxShape.circle,
                          ):
                          BoxDecoration(
                            color: Colors.lightGreen,
                            shape: BoxShape.circle,
                          )
                        ),
                      );
                    }),

                    SizedBox(width: 20,),
                    Text(data.stateAreas[index].name!,style: lightThemenormalStyle,),
                  ],
                ),
              );
            });
  });
}
