import 'package:flutter/material.dart';
import 'package:net_market/const/api_constants.dart';
import 'package:net_market/const/global_constants.dart';
import 'package:net_market/providers/categories_provider.dart';
import 'package:net_market/providers/store_provider.dart';
import 'package:net_market/ui/screens/delivery_screen/delivery_screen.dart';
import 'package:provider/provider.dart';

import '../../../services/localization.dart';
import '../../app_widgets/app_bar.dart';
import '../orderTime_screen/orderTime_screen.dart';
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
        appBar: MyAppBar(context, data.store.name ?? "", true, false),
        body: SingleChildScrollView(
          child: Column(
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
                      height: size.height * .3,
                      color: Colors.blue,
                      child: Image.network(
                        "${ApiConstants.IMAGE}${data.store.bannar}",
                        fit: BoxFit.fill,
                        errorBuilder: (context, error, stackTrace) =>
                            Image.asset(
                          "assets/cover.jpg",
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
              SizedBox(
                height: size.height * 0,
              ),
              /*Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => OrderTimeScreen()));
                    },
                    child: Container(
                      height: size.height * .08,
                      width: size.width * .45,
                      decoration: BoxDecoration(
                          color: Colors.green,
                          border: Border.all(color: Colors.blue, width: 2),
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text(
                          AppLocalization.of(context)
                              .getTranslatedValue("order_time")
                              .toString(),
                          style: normalwhite,
                        ),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              // mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  AppLocalization.of(context)
                                      .getTranslatedValue("delivery_to")
                                      .toString(),
                                  style: lightThemenormalStyle,
                                ),
                                Expanded(
                                  child: Text(
                                    AppLocalization.of(context)
                                        .getTranslatedValue("client_name")
                                        .toString(),
                                    style: lightThemetitleStyle,
                                  ),
                                )
                              ],
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
              ),*/
              Consumer<CategoriesProvider>(builder: (context, catdata, _) {
                return catdata.maincategories.length == 0
                    ? Padding(
                      padding: const EdgeInsets.all(88.0),
                      child: CircularProgressIndicator(),
                    )
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
