import 'package:flutter/material.dart';
import 'package:net_market/const/global_constants.dart';
import 'package:provider/provider.dart';

import '../../../models/category_model.dart';
import '../../../providers/categories_provider.dart';
import 'singlecategory_widget.dart';

class HomeSetUp extends StatefulWidget {
  HomeSetUp({super.key, required this.mainCategories});

  final List<MainCategory> mainCategories;

  @override
  State<HomeSetUp> createState() => _HomeSetUpState();
}

class _HomeSetUpState extends State<HomeSetUp> {
  late CategoriesProvider categoriesProvider;
  bool _isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    categoriesProvider =
        Provider.of<CategoriesProvider>(context, listen: false);
    // categoriesProvider.getproductListByCategory(categoryId);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoriesProvider>(builder: (context, data, _) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
              //  color: Colors.transparent,
              padding: EdgeInsets.symmetric(horizontal: 0),
              height: MediaQuery.of(context).size.height * .09,
              // width: MediaQuery.of(context).size.width * 2,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: widget.mainCategories.length,
                  itemBuilder: (context, index) {
                    return widget.mainCategories.length == 0
                        ? Container()
                        : InkWell(
                            onTap: () async {
                              setState(() {
                                _isLoading = true;
                              });
                              await Future.delayed(const Duration(seconds: 8));
                              data.getproductListByCategory(
                                  widget.mainCategories[index].id);
                              setState(() {
                                _isLoading = false;
                              });
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                widget.mainCategories[index].name,
                                style: lightThemenormalStyle,
                              ),
                            ),
                          );
                  })),
          !_isLoading
              ? SingleCategory()
              : Center(
                  child: CircularProgressIndicator(),
                )
        ],
      );
    });
  }
}
