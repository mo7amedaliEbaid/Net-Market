import 'package:flutter/material.dart';
import 'package:net_market/const/global_constants.dart';
import 'package:net_market/providers/store_provider.dart';
import 'package:net_market/ui/screens/delivery_screen/delivery_body.dart';
import 'package:net_market/ui/screens/delivery_screen/pickup_body.dart';
import 'package:provider/provider.dart';

class DeliveryScreen extends StatefulWidget {
  const DeliveryScreen({Key? key}) : super(key: key);

  @override
  State<DeliveryScreen> createState() => _DeliveryScreenState();
}

class _DeliveryScreenState extends State<DeliveryScreen> {
  bool pickupSelected = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<StoreProvider>(builder: (context,data,_){
      return Scaffold(
        appBar: AppBar(
          title: Text(data.store.name!),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                        onTap: () {
                          setState(() {
                            pickupSelected = false;
                          });
                        },
                        child: Text(
                          "Delivery",
                          style: pickupSelected
                              ? lightThemenormalStyle
                              : underlinedTitle,
                        )),
                    SizedBox(
                      width: size.width * .05,
                    ),
                    InkWell(
                        onTap: () {
                          setState(() {
                            pickupSelected = true;
                          });
                        },
                        child: Text(
                          "PickUp",
                          style: pickupSelected
                              ? underlinedTitle
                              : lightThemenormalStyle,
                        ))
                  ],
                ),
              ),
              pickupSelected?PickupBody():DeliveryBody()
            ],
          ),
        ),
      );
    });

  }
}
