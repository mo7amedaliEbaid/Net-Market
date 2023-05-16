import 'package:flutter/material.dart';
import 'package:net_market/const/global_constants.dart';
import 'package:net_market/providers/store_provider.dart';
import 'package:provider/provider.dart';

import '../../custom_widgets/app_bar.dart';
import '../../../providers/categories_provider.dart';
import '../home_screen/singlecategory_widget.dart';
class CategoriesScreen extends StatefulWidget {
  const CategoriesScreen({Key? key}) : super(key: key);

  @override
  State<CategoriesScreen> createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  List<bool> strikeList = [];
  CategoriesProvider categoriesProvider=CategoriesProvider();
  @override
  void initState() {
    categoriesProvider=Provider.of<CategoriesProvider>(context,listen: false);
    strikeList = List.generate(categoriesProvider.maincategories.length, (index)=>false);
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
                height: size.height*.1,
                width: size.width*3.5,
                child: ListView.builder(
                  shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: catsdata.maincategories.length,
                    itemBuilder: (context,index){
                  return InkWell(
                    onTap: (){
                      setState(() {
                        bool temp = !strikeList[index];
                        strikeList.removeAt(index);
                        strikeList.insert(index, temp);
                        catsdata.getproductListByCategory(catsdata.maincategories[index].id);
                      });

                    },
                    child: Container(
                      margin: EdgeInsets.all(10),
                        child: Text(catsdata.maincategories[index].name,
                          style: strikeList[index] ? lightThemetitleStyle : lightThemenormalStyle,)),
                  );
                }),
              ),
              Flexible(child: SingleCategory())
            ],
          ),
        ),
      );
    });

  }
}
