import 'package:flutter/material.dart';
import 'package:net_market/customized/bottom_sheets/country.dart';
import 'package:net_market/theme/theme_data.dart';
import 'package:provider/provider.dart';

import '../../const/global_constants.dart';
import '../../customized/app_bar.dart';
import '../../customized/bottom_sheets/language.dart';
import '../../customized/bottom_sheets/login.dart';
import '../../providers/darkTheme_provider.dart';
import '../../services/localization.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {

  Styles styles = Styles();

  @override
  Widget build(BuildContext context) {
    final themeState = Provider.of<DarkThemeProvider>(context);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: MyAppBar(context,""),
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
                                    image:
                                        AssetImage('assets/User-img@3x.png'))),
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              LoginBottomSheet(context),
                              SizedBox(
                                width: size.width * .04,
                              ),
                              Container(
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
                                    style:lightThemetitleStyle,
                                  ),
                                ),
                              ),
                            ],
                          ),
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
                            Column(
                              children: [
                                Icon(Icons.business),
                                Text('My Orders'),
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
                                Icon(Icons.favorite_border),
                                Text('My Favourites'),
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
                                Icon(Icons.notification_add_outlined),
                                Text('Notification'),
                              ],
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
                                Icon(Icons.warning_amber_sharp),
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
                                Icon(Icons.contact_phone_outlined),
                                Text('Contact Us'),
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
                                Icon(Icons.share),
                                Text('App Share'),
                              ],
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
            Container(
              margin: EdgeInsets.fromLTRB(10, 15, 10, 0),
              height: 1,
              color: Colors.grey.shade300,
            ),
            SwitchListTile(
              title: Text(
                AppLocalization.of(context)
                    .getTranslatedValue("notification")
                    .toString(),
                style:lightThemenormalStyle,
              ),
              value: true,
              activeColor: Colors.green,
              activeTrackColor: Colors.grey.shade200,
              inactiveTrackColor: Colors.grey.shade200,
              onChanged: (bool value) {
                setState(() {});
              },
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10),
              height: 1,
              color: Colors.grey.shade300,
            ),
            SwitchListTile(
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
                  themeState.setDarkTheme = value;
                });
              },
              value: themeState.getDarkTheme,
            ),
          ],
        ),
      ),
    );
  }
}
