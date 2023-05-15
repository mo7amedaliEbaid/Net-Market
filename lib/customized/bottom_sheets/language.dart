import 'package:flutter/material.dart';
import 'package:net_market/const/app_constants.dart';
import 'package:provider/provider.dart';

import '../../const/global_constants.dart';
import '../../models/language_model.dart';
import '../../providers/locale_provider.dart';
import '../../services/localization.dart';

Widget LanguageBottomSheet(BuildContext context) {
  Locale _changeLanguage(Language language, context) {
    Locale _a;
    switch (language.languageCode) {
      case Appconstants.ENGLISH:
        _a = Locale(language.languageCode, "US");

        break;
      case Appconstants.Arabic:
        _a = Locale(language.languageCode, "EG");

        break;

      default:
        _a = Locale(language.languageCode, 'US');
    }
    return _a;
  }

  void _languagemodalBottomSheetMenu() {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return new Container(
            height: MediaQuery.of(context).size.height * .25,
            color: Color(0xFF737373),
            child: new Container(
              decoration: new BoxDecoration(
                  color: Colors.white,
                  borderRadius: new BorderRadius.only(
                      topLeft: const Radius.circular(25.0),
                      topRight: const Radius.circular(25.0))),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppLocalization.of(context)
                              .getTranslatedValue("language")
                              .toString(),
                          style: lightThemetitleStyle,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.clear,
                            color: Colors.black,
                            size: 25,
                          ),
                        )
                      ],
                    ),
                  ),
                  Consumer<LocaleCont>(builder: (context, data, _) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: Language.languageList()
                          .map(
                            (e) => Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 7),
                              child: InkWell(
                                onTap: () {
                                  data.updateLocale(
                                      _changeLanguage(e, context));
                                  Navigator.pop(context);
                                  //iconpressed=!iconpressed;
                                  // eniconpressed=!eniconpressed;
                                  print('kkkkkkkkkkkkkkkkkkkkkkkkkkkkk');
                                },
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Center(
                                        child: Text(
                                      "${e.name}",
                                      style: lightThemenormalStyle,
                                    )),
                                    Icon(
                                      Icons.check_circle_outline,
                                      size: 25,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          )
                          .toList(),
                    );
                  })
                ],
              ),
            ),
          );
        });
  }

  return InkWell(
    onTap: () {
      _languagemodalBottomSheetMenu();
      // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>LanguageScreen()));
    },
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            AppLocalization.of(context)
                .getTranslatedValue("language")
                .toString(),
            style: lightThemenormalStyle,
          ),
          //SizedBox(width: size.width*0.43),
          Icon(Icons.arrow_forward_ios, size: 24),
        ],
      ),
    ),
  );
}
