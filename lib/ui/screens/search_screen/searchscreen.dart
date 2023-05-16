import 'package:flutter/material.dart';
import 'package:net_market/providers/search_provider.dart';
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

  @override
  void initState() {
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
                prefixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Icon(
                    Icons.arrow_back,
                    color: Colors.blue.shade900,
                  ),
                ),
                hintText: "Search Products",
                suffixIcon: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: InkWell(
                      onTap: () => Navigator.pop(context),
                      child: Icon(Icons.clear)),
                ),
              ),
              onSubmitted: (String searchvalue) {
                setState(() {
                  searchProvider.getproductListBySearch(searchvalue);
                });
              },
            ),
            Consumer<SearchProvider>(builder: (context, data, _) {
              return data.productListBySearch.length == 0
                  ? Center(
                child: Text("Search Your Favourite Products",style: lightThemenormalStyle,),
              )
                  : Flexible(
                    child: Container(
                       // height: size.height * .79,
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
                                    Container(
                                      height: size.height * .25,
                                      width: size.width * .44,
                                      decoration: BoxDecoration(
                                          // border:Border.all(color: Colors.amber,width: 1),
                                          // borderRadius: BorderRadius.circular(10),
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  "${ApiConstants.IMAGE}${data.productListBySearch[index].productPictures![index].pictureUrl}"),
                                              fit: BoxFit.fill)),
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
