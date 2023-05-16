import 'package:flutter/material.dart';
import 'package:net_market/const/api_constants.dart';
import 'package:net_market/const/global_constants.dart';
import 'package:net_market/models/product_model.dart';
import 'package:net_market/providers/store_provider.dart';
import 'package:provider/provider.dart';
import '../../custom_widgets/app_bar.dart';
import '../../../providers/cart_provider.dart';

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

  @override
  void initState() {
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
              height: size.height * .5,
              child: PageView.builder(
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
                                Icon(Icons.saved_search),
                                Icon(Icons.share),
                                Icon(Icons.favorite_border),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: size.width * .45,
                  height: size.height * .2,
                  child: Text(
                    widget.chosenproduct.shortDescription ??
                        "short description test yyyyyy yyyypppp ppppp",
                    style: lightThemenormalStyle,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                )
              ],
            ),
            Container(
              child: Row(
                children: <Widget>[
                  IconButton(
                    icon: const Icon(Icons.remove),
                    color: const Color.fromRGBO(132, 132, 132, 1),
                    splashColor: Theme.of(context).accentColor,
                    disabledColor: const Color.fromRGBO(150, 150, 150, 1),
                    onPressed: widget.chosenproduct.quantity == 0
                        ? null
                        : () {
                            setState(() {
                              newquantity--;
                              newquantity = widget.chosenproduct.quantity - 1;
                              cartProvider.updateQuantity(
                                  widget.chosenproduct, newquantity);
                            });
                          },
                  ),
                  Container(
                    color: Colors.white,
                    padding: const EdgeInsets.all(10),
                    child: Text(
                      newquantity.toString(),
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.add),
                    color: const Color.fromRGBO(132, 132, 132, 1),
                    splashColor: Theme.of(context).accentColor,
                    onPressed: () {
                      setState(() {
                        newquantity = widget.chosenproduct.quantity + 1;
                        newquantity++;
                        cartProvider.updateQuantity(
                            widget.chosenproduct, newquantity);
                      });
                    },
                  ),
                ],
              ),
            ),
            ElevatedButton(onPressed:(){
              setState(() {

              });
              cartProvider.add(widget.chosenproduct, 1);
            }, child: Text("buy"))
          ],
        ),
      );
    });
  }
}
