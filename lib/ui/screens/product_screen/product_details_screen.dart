import 'package:flutter/material.dart';
import 'package:net_market/const/api_constants.dart';
import 'package:net_market/const/global_constants.dart';
import 'package:net_market/models/product_model.dart';
import 'package:net_market/providers/store_provider.dart';
import 'package:provider/provider.dart';
import '../../custom_widgets/app_bar.dart';
import '../../../providers/cart_provider.dart';
import '../../custom_widgets/dots_indicator.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({Key? key, required this.chosenproduct})
      : super(key: key);
  final Product chosenproduct;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  late CartProvider cartProvider;
  int newquantity = 0;
  double page = 0;

  PageController? pageController;


  @override
  void initState() {
    pageController = PageController(initialPage: 0)
      ..addListener(() {
        setState(() {});
      });
    cartProvider = Provider.of(context, listen: false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<StoreProvider>(builder: (context, data, _) {
      return Scaffold(
        appBar: MyAppBar(context, data.store.name!),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(horizontal: 38, vertical: 10),
              height: size.height * .54,
              child:Stack(
                children: [
                  PageView.builder(
                      controller: pageController,
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return Stack(
                          children: [
                            Container(
                              width: size.width * .8,
                              height: size.height * .5,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                      image: NetworkImage(
                                          "${ApiConstants.IMAGE}${widget.chosenproduct.productPictures!.first.pictureUrl}"),
                                      fit: BoxFit.fill)),
                            ),
                            Positioned(
                              top: 0,
                              right: 0,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    Container(
                                        margin: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle
                                        ),
                                        child: Icon(Icons.saved_search)),
                                    Container(
                                        margin: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle
                                        ),
                                        child: Icon(Icons.share)),
                                    Container(
                                        margin: EdgeInsets.all(5),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            shape: BoxShape.circle
                                        ),
                                        child: Icon(Icons.favorite_border)),
                                  ],
                                ),
                              ),
                            ),

                          ],
                        );
                      }),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    left: 0,
                    child:MyDotsIndicator( pageController!.hasClients?pageController!.page:0,), )
                ],
              )

            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: size.width * .45,
                    height: size.height * .08,
                    child: Text(
                      widget.chosenproduct.shortDescription ??
                          "short description test yyyyyy yyyypppp ppppp",
                      style: lightThemenormalStyle,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Column(
                    children: [
                      Text("${widget.chosenproduct.price.toString()} KWD",style: greenStyle,),
                      Text("${widget.chosenproduct.oldPrice.toString()} KWD",style: oldpriceStyle,)
                    ],
                  )
                ],
              ),
            ),


            Container(
              width: size.width*.35,
              height: size.height*.05,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.lightBlue.shade900,width: 2)
              ),

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  InkWell(
                    onTap: widget.chosenproduct.quantity == 0
                        ? null
                        : () {
                      setState(() {
                        newquantity--;
                        newquantity = widget.chosenproduct.quantity - 1;
                        cartProvider.updateQuantity(
                            widget.chosenproduct, newquantity);
                      });
                    },
                    child: Container(
                      child: Icon(Icons.remove,size: 22,color: Colors.white,),
                    ),

                  ),
                  Container(
                    color: Colors.white,
                    width: 45,
                    margin: EdgeInsets.symmetric(),
                    padding: const EdgeInsets.all(10),
                    child: Center(
                      child: Text(
                        newquantity.toString(),
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      setState(() {
                        newquantity = widget.chosenproduct.quantity + 1;
                        newquantity++;
                        cartProvider.updateQuantity(
                            widget.chosenproduct, newquantity);
                      });
                    },
                    child: Container(
                      child: Icon(Icons.add,size: 22,color: Colors.white,),
                    ),

                  ),
                ],
              ),
            ),
            Container(
              width: size.width*.8,
              height: size.height*.07,
              margin: EdgeInsets.fromLTRB(30,50,30,5),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10)
              ),
              child: InkWell(onTap:(){
                setState(() {
                  cartProvider.add(widget.chosenproduct, newquantity);
                });

              }, child: Center(child: Text("Add To Cart",style: bigwhite,))),
            )
          ],
        ),
      );
    });
  }
}
