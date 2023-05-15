import 'package:flutter/material.dart';
import 'package:net_market/const/api_constants.dart';
import 'package:net_market/customized/app_bar.dart';
import 'package:net_market/models/category_model.dart';
import 'package:net_market/providers/categories_provider.dart';
import 'package:net_market/providers/store_provider.dart';
import 'package:provider/provider.dart';

import '../../const/global_constants.dart';
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
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: size.height * .1,
                    width: size.width * .355,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue, width: 2)),
                  ),
                  Container(
                    width: size.width * .355,
                    height: size.height * .1,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue, width: 2)),
                  ),
                ],
              ),
              Consumer<CategoriesProvider>(builder: (context, catdata, _) {
                return catdata.maincategories.length==0?
                    CircularProgressIndicator():
                  HomeSetUp(mainCategories: catdata.maincategories,);
              }),
            ],
          ),
        ),
      );
    });
  }
}

