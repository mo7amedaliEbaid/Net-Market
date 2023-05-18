import 'package:flutter/material.dart';
import 'package:net_market/const/global_constants.dart';
class PickupBody extends StatefulWidget {
  const PickupBody({Key? key}) : super(key: key);

  @override
  State<PickupBody> createState() => _PickupBodyState();
}

class _PickupBodyState extends State<PickupBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("branches".toUpperCase(),style: lightThemetitleStyle,),
        Text("select Branch",style: lightThemenormalStyle,),
      ],
    );
  }
}
