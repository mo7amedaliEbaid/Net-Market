import 'package:flutter/material.dart';
import 'package:net_market/theme/theme_data.dart';

import '../const/global_constants.dart';
import '../services/localization.dart';
PreferredSizeWidget MyAppBar(BuildContext context,String title){
  Size size = MediaQuery.of(context).size;
  return AppBar(
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Container(
              width: size.height * .08,
              height: size.width * .08,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/Country@3x.png')),
                shape: BoxShape.circle,
              ),
            ),
            SizedBox(
              width: 12,
            ),
            Icon(Icons.search),
          ],
        ),
        Text(title),
        /*AppLocalization.of(context)
            .getTranslatedValue("title")
            .toString()),*/
        Container(
          width: size.width * .09,
          height: size.height * .09,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.blue, width: 3.0),
            shape: BoxShape.circle,
          ),
          child: Center(
              child: Text(
                'ع',
                style:lightThemetitleStyle,
              )),
        )
      ],
    ),
  );
}