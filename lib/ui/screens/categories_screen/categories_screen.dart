import 'package:flutter/material.dart';
import 'package:net_market/const/global_constants.dart';
import 'package:net_market/providers/store_provider.dart';
import 'package:provider/provider.dart';

import '../../../providers/categories_provider.dart';
import '../../app_widgets/app_bar.dart';
import '../../app_widgets/singlecategory_widget.dart';
class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  late CategoriesProvider categoriesProvider;
  int pressedAttentionIndex  = -1;
  bool _isLoading = false;
  bool scrollableGridview=true;
  @override
  void initState() {
    categoriesProvider=Provider.of<CategoriesProvider>(context,listen: false);
   // categoriesProvider.getproductListByCategory(widget.mainCategories.first.id);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Consumer2<StoreProvider,CategoriesProvider>(builder: (context,storedata,catsdata,_){
      return Scaffold(
        appBar: MyAppBar(context, storedata.store.name!),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container(
                height: size.height*.08,
                width: size.width*3.5,
                child: ListView.builder(
                  shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: catsdata.maincategories.length,
                    itemBuilder: (context,index){
                      final pressAttention = pressedAttentionIndex == index;
                  return InkWell(
                    onTap: ()async{
                      setState(() {
                        catsdata.getproductListByCategory(
                            catsdata.maincategories[index].id);
                        pressedAttentionIndex = index;
                        _isLoading = true;
                      });
                      await Future.delayed(const Duration(seconds: 6));
                      setState(() {
                        _isLoading = false;
                      });

                    },
                    child: Container(
                      margin: EdgeInsets.all(10),
                        child: Text(
                      catsdata.maincategories[index].name,
                      style:  pressAttention ? underlinedTitle: lightThemenormalStyle,
                      ),)
                  );
                }),
              ),
              !_isLoading
                  ? Container(
                  height: size.height*.7,
                  child: SingleCategory(isScrollable: scrollableGridview,))
                  : Center(
                child: CircularProgressIndicator(),
              )

            ],
          ),
        ),
      );
    });

  }
}
