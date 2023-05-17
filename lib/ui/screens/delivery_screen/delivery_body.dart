import 'package:flutter/material.dart';
import 'package:net_market/const/global_constants.dart';
import 'package:net_market/providers/delivery_provider.dart';
import 'package:net_market/ui/screens/delivery_screen/areaslist_widget.dart';
import 'package:provider/provider.dart';

class DeliveryBody extends StatefulWidget {
  const DeliveryBody({Key? key}) : super(key: key);

  @override
  State<DeliveryBody> createState() => _DeliveryBodyState();
}

class _DeliveryBodyState extends State<DeliveryBody> {
  late DeliveryProvider deliveryProvider;
  List<bool> showQty = [];
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    deliveryProvider = Provider.of<DeliveryProvider>(context, listen: false);
    deliveryProvider.getstatesbyCountry();
    for (int i = 0; i < deliveryProvider.countryStates.length; i++) {
      showQty.add(false);
    }
  }

  void showHide(int i) {
    setState(() {
      showQty[i] = !showQty[i];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DeliveryProvider>(builder: (context, data, _) {
      Size size = MediaQuery.of(context).size;
      return Container(
        height: size.height * .7,
        width: size.width * .9,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: data.countryStates.length,
          itemBuilder: (context, index) {
            return data.countryStates.length == 0
                ? CircularProgressIndicator()
                : InkWell(
                    onTap: ()async {
                      setState(() {
                        data.getareasbyState(data.countryStates[index].id!);
                        isLoading = true;
                        showHide(index);
                      });
                      await Future.delayed(const Duration(seconds: 6));
                      setState(() {
                        isLoading = false;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                data.countryStates[index].name!,
                                style: lightThemetitleStyle,
                              ),
                              Icon(
                                Icons.keyboard_arrow_down_sharp,
                                size: 25,
                              )
                            ],
                          ),
                          showQty[index] ? buildAreasList(isLoading) : Container()
                        ],
                      ),
                    ),
                  );
          },
        ),
      );
    });
  }
}
