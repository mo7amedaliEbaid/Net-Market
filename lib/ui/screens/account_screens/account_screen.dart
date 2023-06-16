import 'package:flutter/material.dart';
import 'package:net_market/providers/store_provider.dart';
import 'package:net_market/ui/app_widgets/bottom_sheets/register.dart';
import 'package:net_market/ui/screens/account_screens/checkout_screen.dart';
import 'package:net_market/ui/screens/account_screens/contactus_screen.dart';
import 'package:net_market/ui/screens/cart_screen/cart_screen.dart';
import 'package:net_market/ui/screens/delivery_screen/delivery_screen.dart';
import 'package:net_market/ui/screens/orderTime_screen/orderTime_screen.dart';
import 'package:net_market/ui/screens/order_screen/order_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../const/global_constants.dart';
import '../../../providers/darkTheme_provider.dart';
import '../../../services/localization.dart';
import '../../app_widgets/app_bar.dart';
import '../../app_widgets/bottom_sheets/country.dart';
import '../../app_widgets/bottom_sheets/language.dart';
import '../../app_widgets/bottom_sheets/login.dart';
import '../../theme/theme_data.dart';
import 'aboutus_screen.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  Styles styles = Styles();



//bool isDark=false;
  @override
  Widget build(BuildContext context) {
    //  final themeState = Provider.of<DarkThemeProvider>(context);
    Size size = MediaQuery.of(context).size;
    return Consumer<StoreProvider>(builder: (context, storedata, _) {
      return storedata.store.name==null?Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ):
        Scaffold(
        appBar: MyAppBar(context, storedata.store.name!, true, false),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Column(
                    //crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: size.height * .355,
                        color: Colors.blue.shade800,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            /*SizedBox(
                            height: size.height * .03,
                          ),*/
                            Container(
                              height: size.height * .16,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/User-img@3x.png'))),
                            ),
                            /* SizedBox(
                            height: size.height * .01,
                          ),*/
                            Text(
                              AppLocalization.of(context)
                                  .getTranslatedValue("welcome_to_s")
                                  .toString(),
                              style: bigwhite,
                            ),
                            /*  SizedBox(
                            height: size.height * .02,
                          ),*/
                           //   getuser()==null?
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                LoginBottomSheet(context),
                                SizedBox(
                                  width: size.width * .04,
                                ),
                                RegisterBottomSheet(context),
                                /*InkWell(
                                  onTap: () {},
                                  child: Container(
                                    //   height: size.height*.085,
                                    //width: size.width*.25,
                                    padding: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7),
                                      color: Colors.white,
                                    ),
                                    child: Center(
                                      child: Text(
                                        AppLocalization.of(context)
                                            .getTranslatedValue("signup")
                                            .toString(),
                                        style: lightThemetitleStyle,
                                      ),
                                    ),
                                  ),
                                ),*/
                              ],
                            )/*:Container(),*/
                          ],
                        ),
                      ),
                      Container(
                        color: Colors.blue.shade800,
                        height: size.height * .12,
                      ),
                      Container(
                        height: size.height * .13,
                      ),
                    ],
                  ),
                  Positioned(
                    top: size.height * .35,
                    left: size.width * .05,
                    right: size.width * .05,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                        border: Border.all(color: Colors.grey, width: 1),
                      ),
                      height: size.height * .25,
                      //width: size.width*.87,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        //crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                onTap: (){
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>OrderScreen()));
                                },
                                child: Column(
                                  children: [
                                    Icon(Icons.business),
                                    Text('My Orders'),
                                  ],
                                ),
                              ),
                              Container(
                                //margin: EdgeInsets.symmetric(vertical: 3),
                                width: 1,
                                height: size.height * .08,
                                color: Colors.grey,
                              ),
                              InkWell(
                                onTap: (){
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>OrderTimeScreen()));
                                },
                                child: Column(
                                  children: [
                                    Icon(Icons.access_time),
                                    Text('Order Time'),
                                  ],
                                ),
                              ),
                              Container(
                                //margin: EdgeInsets.symmetric(vertical: 3),
                                width: 1,
                                height: size.height * .08,
                                color: Colors.grey,
                              ),
                              InkWell(
                                onTap: (){
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>DeliveryScreen()));
                                },
                                child: Column(
                                  children: [
                                    Icon(Icons.location_history),
                                    Text('Order Location'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 10),
                            height: 1,
                            color: Colors.grey.shade300,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  InkWell(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    AboutusScreen()));
                                      },
                                      child: Icon(Icons.warning_amber_sharp)),
                                  Text('About Us'),
                                ],
                              ),
                              Container(
                                //margin: EdgeInsets.symmetric(vertical: 3),
                                width: 1,
                                height: size.height * .08,
                                color: Colors.grey,
                              ),
                              Column(
                                children: [
                                  InkWell(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ContactUsscreen()));
                                      },
                                      child:
                                          Icon(Icons.contact_phone_outlined)),
                                  Text('Contact Us'),
                                ],
                              ),
                              Container(
                                //margin: EdgeInsets.symmetric(vertical: 3),
                                width: 1,
                                height: size.height * .08,
                                color: Colors.grey,
                              ),
                              InkWell(
                                onTap: (){
                                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=>CartScreen()));
                                },
                                child: Column(
                                  children: [
                                    Icon(Icons.shopping_basket),
                                    Text('Your Cart'),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: size.height * 0.04),
              CountryBottomSheet(context),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                height: 1,
                color: Colors.grey.shade300,
              ),
              LanguageBottomSheet(context),
              /*Container(
                margin: EdgeInsets.fromLTRB(10, 15, 10, 0),
                height: 1,
                color: Colors.grey.shade300,
              ),
              SwitchListTile(
                title: Text(
                  AppLocalization.of(context)
                      .getTranslatedValue("notification")
                      .toString(),
                  style: lightThemenormalStyle,
                ),
                value: true,
                activeColor: Colors.green,
                activeTrackColor: Colors.grey.shade200,
                inactiveTrackColor: Colors.grey.shade200,
                onChanged: (bool value) {
                  setState(() {});
                },
              ),*/
              /*Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                height: 1,
                color: Colors.grey.shade300,
              ),*/
              /*Consumer<DarkThemeProvider>(builder: (context, themedata, _) {
                return SwitchListTile(
                  title: Text(
                    AppLocalization.of(context)
                        .getTranslatedValue("dark_mode")
                        .toString(),
                    style: lightThemenormalStyle,
                  ),
                  activeColor: Colors.green,
                  inactiveThumbColor: Colors.blue,
                  activeTrackColor: Colors.grey.shade200,
                  inactiveTrackColor: Colors.grey.shade200,
                  onChanged: (bool value) {
                    setState(() {
                      themedata.setDarkTheme(value);
                      //  themedata.getdarkTheme=!themedata.getdarkTheme;
                      themedata.getdarkTheme = value;
                    });
                  },
                  value: themedata.getdarkTheme,
                );
              })*/
            ],
          ),
        ),
      );
    });
  }
}
