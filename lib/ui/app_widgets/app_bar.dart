import 'package:flutter/material.dart';
import 'package:net_market/ui/app_widgets/bottom_sheets/country.dart';
import 'package:net_market/ui/app_widgets/bottom_sheets/language.dart';

import '../../const/global_constants.dart';
import '../screens/search_screen/searchscreen.dart';

PreferredSizeWidget MyAppBar(
    BuildContext context, String title, bool iscountry, bool isautmatically,
    {bool isSearch = true, bool iscart = false}) {
  Size size = MediaQuery.of(context).size;
  return AppBar(
    automaticallyImplyLeading: isautmatically,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            iscountry
                ? ABCountryBottomSheet(context)
                : Container(),
            SizedBox(
              width: 12,
            ),
            isSearch
                ? InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => SearchScreen()));
                    },
                    child: Icon(Icons.search))
                : Container(),
          ],
        ),
        Text(title),
        /*AppLocalization.of(context)
            .getTranslatedValue("title")
            .toString()),*/
        iscart ? Icon(Icons.shopping_bag_outlined) : Container(),
        ABLanguageBottomSheet(context)
        /*Container(
          width: size.width * .09,
          height: size.height * .09,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blue, width: 3.0),
            shape: BoxShape.circle,
          ),
          child: Center(
              child: Text(
            'ع',
            style: lightThemetitleStyle,
          )),
        )*/
      ],
    ),
  );
}
