import 'package:flutter/material.dart';
import 'package:net_market/const/api_constants.dart';
import 'package:net_market/const/global_constants.dart';
import 'package:net_market/providers/categories_provider.dart';
import 'package:provider/provider.dart';

import '../screens/product_screen/product_details_screen.dart';

class SingleCategory extends StatefulWidget {
  SingleCategory({Key? key, required this.isScrollable}) : super(key: key);
final bool isScrollable;

  @override
  State<SingleCategory> createState() => _SingleCategoryState();
}

class _SingleCategoryState extends State<SingleCategory> {

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoriesProvider>(builder: (context, data, _) {
      Size size = MediaQuery.of(context).size;
      return data.productListByCategory.length == 0
          ? CircularProgressIndicator()
          : Padding(
            padding: const EdgeInsets.all(8.0),
            child: Flexible(
              child: GridView.builder(
                  physics: widget.isScrollable?
                      ClampingScrollPhysics():
                  NeverScrollableScrollPhysics(),
                 shrinkWrap: true,
                  itemCount: data.productListByCategory.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 2 / 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.fromLTRB(0, 5, 0, 0),
                      //height: size.height * .15,
                     // width: size.width * .35,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.green, width: 2),
                        borderRadius: BorderRadius.circular(10),
                        // image: DecorationImage(image: NetworkImage("${ApiConstants.IMAGE}${data.productListByCategory[index].productPictures.first.pictureUrl}"))
                      ),
                      child: Column(
                        children: [
                          InkWell(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=>ProductDetailsScreen(chosenproduct: data.productListByCategory[index])));
                            },
                            child: Container(
                              height: size.height * .25,
                              width: size.width * .44,
                              decoration: BoxDecoration(
                                  // border:Border.all(color: Colors.amber,width: 1),
                                  // borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          "${ApiConstants.IMAGE}${data.productListByCategory[index].productPictures!.first.pictureUrl}"),
                                      fit: BoxFit.fill)),
                            ),
                          ),
                          Container(
                            width: size.width * .44,
                            padding: EdgeInsets.fromLTRB(0, 10, 5, 5),
                            child: Text(
                              data.productListByCategory[index].name.toString(),
                              style: lightThemenormalStyle,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text("${data.productListByCategory[index].price} KWD",style: greenStyle,),
                              Text("${data.productListByCategory[index].price} KWD",style: oldpriceStyle,),
                            ],
                          )
                        ],
                      ),
                    );
                  }),
            ),
          );
    });
  }
}
