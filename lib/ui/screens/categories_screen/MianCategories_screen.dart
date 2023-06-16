import 'package:flutter/material.dart';
import 'package:net_market/providers/store_provider.dart';
import 'package:net_market/ui/app_widgets/app_bar.dart';
import 'package:net_market/ui/screens/categories_screen/categoriesdetails_screen.dart';
import 'package:provider/provider.dart';

import '../../../const/api_constants.dart';
import '../../../const/app_constants.dart';
import '../../../const/global_constants.dart';
import '../../../providers/categories_provider.dart';

class MainCategoriesScreen extends StatefulWidget {
  const MainCategoriesScreen({Key? key}) : super(key: key);

  @override
  State<MainCategoriesScreen> createState() => _MainCategoriesScreenState();
}

class _MainCategoriesScreenState extends State<MainCategoriesScreen> {
  late CategoriesProvider categoriesProvider;

  @override
  void initState() {
    categoriesProvider =
        Provider.of<CategoriesProvider>(context, listen: false);
    categoriesProvider.getallcategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<StoreProvider>(builder: (context, storedata, _) {
      return Scaffold(
        appBar: MyAppBar(context, storedata.store.name!,true,false),
        body: Consumer<CategoriesProvider>(builder: (context, data, _) {
          Size size = MediaQuery.of(context).size;
          return data.maincategories.length == 0
              ? CircularProgressIndicator()
              : Padding(
                  padding: const EdgeInsets.fromLTRB(10, 30, 10, 18.0),
                  child: GridView.builder(
                      shrinkWrap: true,
                      itemCount: data.maincategories.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 2.2 / 2.5,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10),
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Container(
                              padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                              //height: size.height * .15,
                              // width: size.width * .35,
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.blue, width: 2),
                                borderRadius: BorderRadius.circular(10),
                                // image: DecorationImage(image: NetworkImage("${ApiConstants.IMAGE}${data.productListByCategory[index].productPictures.first.pictureUrl}"))
                              ),
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    data.getproductListByCategory(
                                        data.maincategories[index].id);
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                CategoriesDetailsScreen()));
                                  });
                                },
                                child: Container(
                                  height: size.height * .2,
                                  width: size.width * .44,
                                  padding: EdgeInsets.all(5),
                                  child: data.maincategories[index]
                                              .pictureUrl ==
                                          null
                                      ? Center(
                                          child: Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: Text(
                                            "No image available for ${data.maincategories[index].name}",
                                            style: lightThemenormalStyle,
                                          ),
                                        ))
                                      : Image.network(
                                          "${ApiConstants.IMAGE}${data.maincategories[index].pictureUrl}",
                                          fit: BoxFit.fill,
                                          errorBuilder:
                                              (context, error, stackTrace) =>
                                                  Image.asset(
                                            "${Appconstants.cats[index]}",
                                            fit: BoxFit.fill,
                                          ),
                                        ),
                                ),
                              ),
                            ),
                            Container(
                              width: size.width * .44,
                              padding: EdgeInsets.fromLTRB(30, 10, 30, 5),
                              child: Text(
                                data.maincategories[index].name.toString(),
                                style: lightThemenormalStyle,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        );
                      }),
                );
        }),
      );
    });
  }
}
