import 'package:flutter/material.dart';
import 'package:net_market/const/global_constants.dart';
import 'package:net_market/providers/delivery_provider.dart';
import 'package:net_market/ui/screens/delivery_screen/deliveryscreen_widgets/areaslist_widget.dart';
import 'package:provider/provider.dart';

class DeliveryBody extends StatefulWidget {
  const DeliveryBody({Key? key}) : super(key: key);

  @override
  State<DeliveryBody> createState() => _DeliveryBodyState();
}

class _DeliveryBodyState extends State<DeliveryBody> {
  late DeliveryProvider deliveryProvider;
  bool isLoading = false;
  int pressedAttentionIndex  = -1;
  @override
  void initState() {
    super.initState();
    deliveryProvider = Provider.of<DeliveryProvider>(context, listen: false);
    deliveryProvider.getstatesbyCountry();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DeliveryProvider>(builder: (context, data, _) {
      Size size = MediaQuery.of(context).size;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(18,0,18,8),
            child: Text("Delivery Area".toUpperCase(),style: lightThemetitleStyle,),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(18,0,18,8),
            child: Text("Select Area",style: lightThemenormalStyle,),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            margin: EdgeInsets.fromLTRB(20, 5, 20, 20),
            height: size.height * .07,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                    color: Colors.greenAccent.shade700, width: 2)),
            child: Row(
              children: [
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 8.0),
                  child: Icon(Icons.search,size: 30),
                ),
                Flexible(
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none, hintText: "Search Area"),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Container(
              height: size.height * .7,
              width: size.width * .9,
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: data.countryStates.length,
                itemBuilder: (context, index) {
                  final pressAttention = pressedAttentionIndex == index;
                  return data.countryStates.length == 0
                      ? CircularProgressIndicator()
                      : Padding(
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
                                    pressAttention?
                                        InkWell(
                                          onTap: (){
                                            setState(() {
                                               pressedAttentionIndex  = -1;
                                            });
                                          },
                                          child: Icon(Icons.keyboard_arrow_up_sharp,
                                            size: 25,),
                                        ):
                                    InkWell(
                                      onTap: ()async {
                                        setState(() {
                                          data.getareasbyState(
                                              data.countryStates[index].id!);
                                          pressedAttentionIndex = index;
                                          isLoading = true;
                                        });
                                        await Future.delayed(
                                            const Duration(seconds:4));
                                        setState(() {
                                          isLoading = false;
                                        });
                                      },
                                      child: Icon(
                                        Icons.keyboard_arrow_down_sharp,
                                        size: 25,
                                      ),
                                    )
                                  ],
                                ),
                              pressAttention  ? buildAreasList(isLoading) : Container()
                              ],
                            ),
                        );
                },
              ),
            ),
          ),
        ],
      );
    });
  }
}
