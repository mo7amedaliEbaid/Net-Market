import 'package:flutter/material.dart';
import 'package:net_market/providers/store_provider.dart';
import 'package:net_market/ui/app_widgets/app_bar.dart';
import 'package:provider/provider.dart';

class CheckOut extends StatelessWidget {
  const CheckOut({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<StoreProvider>(builder: (context, storedata, _) {
      return Scaffold(
        appBar: MyAppBar(context, storedata.store.name!, true, false),
        body: Container(),
      );
    });
  }
}
