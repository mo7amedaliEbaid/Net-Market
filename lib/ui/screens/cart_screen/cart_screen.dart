import 'dart:developer';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:net_market/const/api_constants.dart';
import 'package:net_market/const/app_constants.dart';
import 'package:net_market/const/global_constants.dart';
import 'package:net_market/models/cart_model.dart';
import 'package:net_market/models/product_model.dart';
import 'package:net_market/providers/store_provider.dart';
import 'package:net_market/ui/app_widgets/app_bar.dart';
import 'package:pay/pay.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../providers/cart_provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen();

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  late final Future<PaymentConfiguration> _googlePayConfigFuture;
  List<PaymentItem> _paymentItems = [
    PaymentItem(
      label: 'Total',
      amount: '99.99',
      status: PaymentItemStatus.final_price,
    )
  ];
  @override
  void initState() {
    super.initState();
    _googlePayConfigFuture =
        PaymentConfiguration.fromAsset('pay.json');
  }

  void onGooglePayResult(paymentResult) {
    debugPrint(paymentResult.toString());
  }


  @override
  Widget build(BuildContext context) {
    return Consumer<StoreProvider>(
      builder: (context, storedata, _) =>
          storedata.store.name==null?
              Scaffold(
                body: Center(child: CircularProgressIndicator()),
              ):
          Scaffold(
        appBar: MyAppBar(context, storedata.store.name!, true, true),
       // backgroundColor: Colors.white,
        body: SafeArea(
            child: Column(
              children: [
                Container(
                  height: 550,
          width: 700,
          padding: const EdgeInsets.all(8),
          child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildTitle(),
                    const SizedBox(
                      height: 10,
                    ),
                    buildListProcduct(context),
                    const SizedBox(
                      height: 10,
                    ),
                    buildTotalPrice(),
                    const SizedBox(
                      height: 10,
                    ),

                  ]),
        ),
                Container(
                  alignment: Alignment.bottomCenter,
                  height: 50,
                  width: 200,
                  child: FutureBuilder<PaymentConfiguration>(
                      future: _googlePayConfigFuture,
                      builder: (context, snapshot) => snapshot.hasData
                          ? GooglePayButton(
                        paymentConfiguration: snapshot.data!,
                        paymentItems: _paymentItems,
                        type: GooglePayButtonType.buy,
                        margin: const EdgeInsets.all( 5.0),

                        onPaymentResult: onGooglePayResult,
                        loadingIndicator: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      )
                          : Container()),
                )
              ],
            )),
      ),
    );
  }

  buildTitle() {
    return Consumer<CartProvider>(
      builder: (context, data, _) {
        return data.listProduct.isEmpty
            ?  Text(
                "Shopping Cart",
                style: lightThemetitleStyle,
                textAlign: TextAlign.left,
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    "Cart",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.left,
                  ),
                  Text(
                    "${data.listProduct.length} products in cart",
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                        fontSize: 12, fontWeight: FontWeight.w300),
                  )
                ],
              );
      },
    );
  }

  buildListProcduct(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Consumer<CartProvider>(
      builder: (context, data, _) {
        return data.listProduct.length == 0
            ? Container(
                child: const Center(
                  child: Text(
                    "No products in cart",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              )
            : Container(
          height: size.height*.55,
                width: size.width*.91,
                child: ListView(
                  shrinkWrap: true,
                scrollDirection: Axis.vertical,
                children: [
                  ...data.listProduct.map((e) => buildProductCard(context, e))
                ],
              ));
      },
    );
  }

  buildProductCard(BuildContext context, Product product) {
    Size size=MediaQuery.of(context).size;
    final _random = new Random();
    String element = Appconstants.alternativeimags[_random.nextInt(Appconstants.alternativeimags.length)];
    return Container(
      width:size.width,
      height: size.height * 0.35,
      padding: EdgeInsets.symmetric(vertical: 60),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.32,
            height: MediaQuery.of(context).size.height * 0.2,
            child: Image.network(
              "${ApiConstants.IMAGE}${product.productPictures!.first.pictureUrl}",
              fit: BoxFit.fill,
              errorBuilder: (context,error,stacktrace)=>
                  Image.asset("${element}",fit: BoxFit.fill,)
              ,
            ),
          ),
          Container(
            height: size.height*.2,
            width: size.width*.52,
            margin: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                    // alignment: Alignment.topRight,
                    margin: EdgeInsets.only(left: 40),
                    padding: const EdgeInsets.all(2),
                    child: InkWell(
                      onTap: () {
                        Provider.of<CartProvider>(context, listen: false)
                            .remove(product);
                      },
                      child: const Icon(
                        Icons.clear,
                        size: 22,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
                Text(
                  product.name!,
                  style: lightThemetitleStyle,
                ),
                Text(
                  product.shortDescription??"short description test short description test",
                  style: lightThemenormalStyle,
                  overflow: TextOverflow.ellipsis,
                ),
                Container(
                  width: size.width*.5,
                  margin: EdgeInsets.all(10),
                  child: Text(
                    "${product.price! * product.quantity}\$",
                    // "test",
                    style: lightThemenormalStyle,
                  ),
                ),
                Container(
                  height: 40,
                  // width: size.width*.5,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      IconButton(
                        icon: const Icon(Icons.remove,color: Colors.red,),
                      //  color: const Color.fromRGBO(132, 132, 132, 1),
                       // splashColor: Theme.of(context).accentColor,
                        onPressed: product.quantity == 0
                            ? null
                            : () {
                          int newQuantity = product.quantity - 1;
                          Provider.of<CartProvider>(context,
                              listen: false)
                              .updateQuantity(product, newQuantity);
                        },
                      ),
                      Container(
                        color: Colors.white,
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          product.quantity.toString(),
                          style: lightThemetitleStyle,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.add,color: Colors.green,),
                       // color: const Color.fromRGBO(132, 132, 132, 1),
                       // splashColor: Theme.of(context).accentColor,
                        onPressed: () {
                          int newQuantity = product.quantity + 1;
                          Provider.of<CartProvider>(context, listen: false)
                              .updateQuantity(product, newQuantity);
                        },
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),


        ],
      ),
    );
  }

  buildTotalPrice() {
    return Consumer<CartProvider>(builder: (context, data, _) {
      return data.listProduct.length == 0
          ? Container()
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Total",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Text("${data.totalPrice()}\$",
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold))
              ],
            );
    });
  }

  buildButtons() {
    return Consumer<CartProvider>(builder: (context, data, _) {
      return data.listProduct.length == 0
          ? Container()
          : ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                  minimumSize: const Size.fromHeight(40)),
              child: const Text("Buy"));
    });
  }
}
