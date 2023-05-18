import 'package:flutter/material.dart';
import 'package:net_market/const/global_constants.dart';
import 'package:provider/provider.dart';

import '../../../models/category_model.dart';
import '../../../providers/categories_provider.dart';
import '../../app_widgets/singlecategory_widget.dart';

class HomeSetUp extends StatefulWidget {
  HomeSetUp({super.key, required this.mainCategories});

  final List<MainCategory> mainCategories;

  @override
  State<HomeSetUp> createState() => _HomeSetUpState();
}

class _HomeSetUpState extends State<HomeSetUp> {
  late CategoriesProvider categoriesProvider;
  int pressedAttentionIndex  = -1;
  bool _isLoading = false;
  bool scrollGridView=false;
  @override
  void initState() {
    categoriesProvider=Provider.of<CategoriesProvider>(context,listen: false);
    categoriesProvider.getproductListByCategory(widget.mainCategories.first.id);
    super.initState();
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
              child: Padding(
                padding: const EdgeInsets.fromLTRB(8.0,20,8,10),
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: widget.mainCategories.length,
                    itemBuilder: (context, index) {
                      final pressAttention = pressedAttentionIndex == index;
                      return widget.mainCategories.length == 0
                          ? Container()
                          : InkWell(
                              onTap: () async {
                                setState(() {
                                  data.getproductListByCategory(
                                      widget.mainCategories[index].id);
                                  pressedAttentionIndex = index;
                                  _isLoading = true;
                                });
                                await Future.delayed(const Duration(seconds: 6));
                                setState(() {
                                  _isLoading = false;
                                });
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  widget.mainCategories[index].name,
                                  style:  pressAttention ? underlinedTitle: lightThemenormalStyle,
                                ),
                              ),
                            );
                    }),
              )),
          !_isLoading
              ? SingleCategory(isScrollable: scrollGridView,)
              : Center(
                  child: CircularProgressIndicator(),
                )
        ],
      );
    });
  }
}
