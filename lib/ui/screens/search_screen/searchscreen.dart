import 'package:flutter/material.dart';
import 'package:net_market/app_setUp.dart';
import 'package:net_market/const/app_constants.dart';
import 'package:net_market/providers/search_provider.dart';
import 'package:net_market/ui/screens/home_screen/home_screen.dart';
import 'package:net_market/ui/screens/product_screen/product_details_screen.dart';
import 'package:provider/provider.dart';

import '../../../const/api_constants.dart';
import '../../../const/global_constants.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late SearchProvider searchProvider;
  TextEditingController _controller = TextEditingController();
bool isloading=false;
late bool ftime;
  @override
  void initState() {
    ftime=true;
    searchProvider = Provider.of<SearchProvider>(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                prefixIcon: InkWell(
                  onTap: (){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>AppSetUp()));
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 18.0),
                    child: Icon(
                      Icons.arrow_back,
                      color: Colors.blue.shade900,
                    ),
                  ),
                ),
                hintText: "Search Products",
                suffixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: InkWell(
                      onTap: () => _controller.clear(),
                      child: Icon(Icons.clear)),
                ),
              ),
              onChanged: (String searchvalue){
                setState(() {
                  isloading==true;
                  ftime==false;
                });
              },
              onSubmitted: (String searchvalue) {
                setState(() {
                  searchProvider.getproductListBySearch(searchvalue);
                  ftime==false;
                });
              },
            ),
            Consumer<SearchProvider>(builder: (context, data, _) {
              print(data.productListBySearch.length .toString());
              return data.productListBySearch.length == 0||ftime==false
                  ? Center(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(78.0),
                      child: Text("Search Your Favourite Products",style: lightThemenormalStyle,),
                    ),
                    Padding(padding: EdgeInsets.all(10),
                      child: CircularProgressIndicator(color: Colors.blue,),
                    )
                  ],
                ),
              )
                  : Flexible(
                    child: Container(
                      margin: EdgeInsets.all(8),
                        child: GridView.builder(
                            shrinkWrap: true,
                            itemCount: data.productListBySearch.length,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
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
                                  border:
                                      Border.all(color: Colors.green, width: 2),
                                  borderRadius: BorderRadius.circular(10),
                                  // image: DecorationImage(image: NetworkImage("${ApiConstants.IMAGE}${data.productListByCategory[index].productPictures.first.pictureUrl}"))
                                ),
                                child: Column(
                                  children: [
                                    InkWell(
                                      onTap: (){
                                        Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>ProductDetailsScreen(chosenproduct: data.productListBySearch[index])));
                                      },
                                      child: Container(
                                        height: size.height * .25,
                                        width: size.width * .44,
                                        decoration: BoxDecoration(
                                            // border:Border.all(color: Colors.amber,width: 1),
                                            // borderRadius: BorderRadius.circular(10),
                                           /* image: DecorationImage(
                                                image: NetworkImage(
                                                    "${ApiConstants.IMAGE}${data.productListBySearch[index].productPictures![index].pictureUrl}"),
                                                fit: BoxFit.fill)),*/
                                      ),
                                      child: Image.network("${ApiConstants.IMAGE}${data.productListBySearch[index].productPictures!.first.pictureUrl}",fit: BoxFit.fill,errorBuilder:
                                      (context,error, stackTrace)=>Image.asset("${Appconstants.alternativeimags[index]}")
                                        ,),
                                      ),
                                    ),
                                    Container(
                                      width: size.width * .44,
                                      padding: EdgeInsets.fromLTRB(0, 10, 5, 5),
                                      child: Text(
                                        data.productListBySearch[index].name
                                            .toString(),
                                        style: lightThemenormalStyle,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          "${data.productListBySearch[index].price} KWD",
                                          style: greenStyle,
                                        ),
                                        Text(
                                          "${data.productListBySearch[index].price} KWD",
                                          style: oldpriceStyle,
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              );
                            }),
                      ),
                  );
            })
          ],
        ),
      ),
    );
  }
}
