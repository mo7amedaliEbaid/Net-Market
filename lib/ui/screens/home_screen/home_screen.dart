import 'package:flutter/material.dart';
import 'package:net_market/const/api_constants.dart';
import 'package:net_market/const/global_constants.dart';
import 'package:net_market/providers/categories_provider.dart';
import 'package:net_market/providers/store_provider.dart';
import 'package:net_market/ui/screens/delivery_screen/delivery_screen.dart';
import 'package:provider/provider.dart';

import '../../app_widgets/app_bar.dart';
import 'home_setUp.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late StoreProvider storeProvider;
  late CategoriesProvider categoriesProvider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    storeProvider = Provider.of<StoreProvider>(context, listen: false);
    storeProvider.getstore();
    categoriesProvider =
        Provider.of<CategoriesProvider>(context, listen: false);
    categoriesProvider.getallcategories();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<StoreProvider>(builder: (context, data, _) {
      return Scaffold(
        appBar: MyAppBar(context, data.store.name ?? ""),
        body: SingleChildScrollView(
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              data.store.bannar == null
                  ? Container(
                      height: size.height * .3,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                      ),
                      child: Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      ),
                    )
                  : Container(
                      // margin: EdgeInsets.symmetric(horizontal: 15),
                      height: size.height * .3,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        image: DecorationImage(
                            image: NetworkImage(
                                "${ApiConstants.IMAGE}${data.store.bannar}"),
                            fit: BoxFit.contain),
                      ),
                    ),
              SizedBox(
                height: size.height * .03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: size.height * .08,
                    width: size.width * .45,
                    decoration: BoxDecoration(
                        color: Colors.green,
                        border: Border.all(color: Colors.blue, width: 2),
                        borderRadius: BorderRadius.circular(20)),
                    child: Center(
                      child: Text(
                        "Order Date",
                        style: normalwhite,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: size.width * .04,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DeliveryScreen()));
                    },
                    child: Container(
                      width: size.width * .45,
                      height: size.height * .08,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue, width: 2),
                          borderRadius: BorderRadius.circular(20)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8.0, vertical: 5),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "Delivery to:",
                                  style: lightThemenormalStyle,
                                ),
                                Text(
                                  "Client Name",
                                  style: lightThemetitleStyle,
                                )
                              ],
                            ),
                            SizedBox(
                              width: size.width * .07,
                            ),
                            Icon(
                              Icons.arrow_forward_ios,
                              size: 25,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Consumer<CategoriesProvider>(builder: (context, catdata, _) {
                return catdata.maincategories.length == 0
                    ? CircularProgressIndicator()
                    : HomeSetUp(
                        mainCategories: catdata.maincategories,
                      );
              }),
            ],
          ),
        ),
      );
    });
  }
}
