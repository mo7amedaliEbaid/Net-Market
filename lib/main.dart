import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:net_market/providers/cart_provider.dart';
import 'package:net_market/providers/darkTheme_provider.dart';
import 'package:net_market/providers/delivery_provider.dart';
import 'package:net_market/providers/locale_provider.dart';
import 'package:net_market/providers/categories_provider.dart';
import 'package:net_market/providers/search_provider.dart';
import 'package:net_market/services/localization.dart';
import 'package:net_market/ui/screens/splash/splash_screen.dart';
import 'package:net_market/ui/theme/theme_data.dart';
import 'package:provider/provider.dart';

import 'providers/store_provider.dart';
main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await DarkThemeProvider().getTheme();
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (_) => DarkThemeProvider()),
      ChangeNotifierProvider(create: (_) => LocaleCont()),
      ChangeNotifierProvider(create: (_) => CategoriesProvider()),
      ChangeNotifierProvider(create: (_) => StoreProvider()),
      ChangeNotifierProvider(create: (_) => SearchProvider()),
      ChangeNotifierProvider(create: (_) => CartProvider()),
      ChangeNotifierProvider(create: (_) => DeliveryProvider()),
    ], child:  MyApp()));}

class MyApp extends StatefulWidget {
   MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late DarkThemeProvider themeChangeProvider;
Styles styles=Styles();
late bool isdarktheme;
  /*void getCurrentAppTheme()async{
    themeChangeProvider.setDarkTheme=await themeChangeProvider.darkThemePrefs.getTheme();
  }*/
  @override
  void initState() {
    themeChangeProvider=Provider.of<DarkThemeProvider>(context,listen: false);
    themeChangeProvider.getdarkTheme;
    //getCurrentAppTheme();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Consumer2<DarkThemeProvider,LocaleCont>(builder: (context,themedata,localedata,_){
      return  MaterialApp(
        locale: localedata.locale,
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          AppLocalization.delegate,
        ],
        supportedLocales: [
          Locale('en', 'US'),
          Locale('ar', 'EG'),
        ],
        localeResolutionCallback: (deviceLocale, supportedLocales) {
          for (var locale in supportedLocales) {
            if (locale.languageCode == deviceLocale!.languageCode &&
                locale.countryCode == deviceLocale.countryCode) {
              return deviceLocale;
            }
          }
          return supportedLocales.first;
        },
        theme: styles.themeData(themedata.getdarkTheme, context),
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      );
    });
  }
}

