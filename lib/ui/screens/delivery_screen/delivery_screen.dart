import 'package:flutter/material.dart';
import 'package:net_market/const/global_constants.dart';

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
    return Scaffold(
      appBar: AppBar(
        title: Text("lllllllllls"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
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
            )
          ],
        ),
      ),
    );
  }
}
