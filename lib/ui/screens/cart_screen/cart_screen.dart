import 'package:flutter/material.dart';
import 'package:net_market/const/api_constants.dart';
import 'package:net_market/models/product_model.dart';
import 'package:provider/provider.dart';

import '../../../providers/cart_provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen();

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: Container(
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
                  buildButtons()
                ]),
          )),
    );
  }

  buildTitle() {
    return Consumer<CartProvider>(
      builder: (context, data, _) {
        return data.listProduct.isEmpty
            ? const Text(
          "Cart",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
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
            : Expanded(
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                ...data.listProduct.map((e) => buildProductCard(context, e))
              ],
            ));
      },
    );
  }

  buildProductCard(BuildContext context, Product product) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13.0),
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(255, 150, 150, 150).withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 3,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Card(
        color: Color.fromARGB(255, 252, 252, 252),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13.0),
        ),
        shadowColor: Color.fromARGB(66, 0, 0, 0),
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.topRight,
              padding: const EdgeInsets.all(2),
              child: InkWell(
                onTap: () {
                  Provider.of<CartProvider>(context, listen: false)
                      .remove(product);
                },
                child: const Icon(
                  Icons.clear,
                  size: 18,
                  color: Color.fromRGBO(132, 132, 132, 1),
                ),
              ),
            ),
            ListTile(
              contentPadding: const EdgeInsets.all(0),
              leading: Image.network(
                "${ApiConstants.IMAGE}${product.productPictures!.first.pictureUrl}",
                fit: BoxFit.contain,
                width: MediaQuery.of(context).size.width * 0.15,
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(
                    product.name!,
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                  Text(
                    product.shortDescription.toString(),
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ],
              ),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "${product.price! * product.quantity}\$",
                    // "test",
                    style: Theme.of(context).textTheme.headline6,
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        IconButton(
                          icon: const Icon(Icons.remove),
                          color: const Color.fromRGBO(132, 132, 132, 1),
                          splashColor: Theme.of(context).accentColor,
                          disabledColor: const Color.fromRGBO(150, 150, 150, 1),
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
                            style: Theme.of(context).textTheme.bodyText1,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.add),
                          color: const Color.fromRGBO(132, 132, 132, 1),
                          splashColor: Theme.of(context).accentColor,
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