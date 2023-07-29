import 'package:flutter/material.dart';
import 'package:net_market/const/global_constants.dart';
import 'package:net_market/ui/screens/delivery_screen/delivery_screen.dart';
import 'package:provider/provider.dart';

import '../../../providers/store_provider.dart';
import '../../app_widgets/app_bar.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<StoreProvider>(builder: (context, storedata, _) {
      return Scaffold(
        appBar: MyAppBar(context, storedata.store.name!,true,false),
        body: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Order Look Up".toUpperCase(),
                style: lightThemetitleStyle,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 18.0),
                child: Text(
                  "Order code can found in my orders page, after placing an order",
                  style: lightThemenormalStyle,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                margin: EdgeInsets.fromLTRB(0, 30, 0, 150),
                height: size.height * .08,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                        color: Colors.greenAccent.shade700, width: 2)),
                child: TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none, hintText: "Enter Order Code"),
                ),
              ),
              Container(
                height: 50,
                //width: size.width * .8,
                //height: size.height * .07,
                margin: EdgeInsets.fromLTRB(0, 170, 0, 15),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10)),
                child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DeliveryScreen()));
                    },
                    child: Center(
                        child: Text(
                      "Order look up".toUpperCase(),
                      style: bigwhite,
                    ))),
              )
            ],
          ),
        ),
      );
    });
  }
}
