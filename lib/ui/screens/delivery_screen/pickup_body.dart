import 'package:flutter/material.dart';
import 'package:net_market/const/global_constants.dart';
import 'package:net_market/providers/delivery_provider.dart';
import 'package:net_market/ui/screens/orderTime_screen/orderTime_screen.dart';
import 'package:provider/provider.dart';

class PickupBody extends StatefulWidget {
  const PickupBody({Key? key}) : super(key: key);

  @override
  State<PickupBody> createState() => _PickupBodyState();
}

class _PickupBodyState extends State<PickupBody> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 5, 10),
          child: Text(
            "branches".toUpperCase(),
            style: lightThemetitleStyle,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
          child: Text(
            "select Branch",
            style: lightThemenormalStyle,
          ),
        ),
        Consumer<DeliveryProvider>(builder: (context, data, _) {
          return data.brancheslist.length == 0
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Container(
                  height: size.height * (.4),
                  margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: GridView.builder(
                      physics: ClampingScrollPhysics(),
                      itemCount: data.brancheslist.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: 2.15 / 3),
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey, width: 1),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              data.brancheslist[index].imageUrl == null
                                  ? Container(
                                      height: size.height * .17,
                                     margin: EdgeInsets.all(10),
                                      child: Image.asset(
                                        "assets/bracherror.jpg",
                                        fit: BoxFit.fill,
                                      ),
                                    )
                                  : Container(
                                      height: size.height * .17,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: NetworkImage(data
                                                  .brancheslist[index]
                                                  .imageUrl))),
                                    ),
                              Text(
                                data.brancheslist[index].name,
                                style: lightThemetitleStyle,
                              )
                            ],
                          ),
                        );
                      }),
                );
        }),
        Container(
          width: size.width * .9,
          height: size.height * .07,
          margin: EdgeInsets.fromLTRB(30, 100, 30, 5),
          decoration: BoxDecoration(
              color: Colors.blue, borderRadius: BorderRadius.circular(10)),
          child: InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context)=>OrderTimeScreen()));
              },
              child: Center(
                  child: Text(
                    "PickUp Time",
                    style: bigwhite,
                  ))),
        )
      ],
    );
  }
}
