import 'package:flutter/material.dart';
import '../../../const/global_constants.dart';
import '../../../services/localization.dart';
  Widget CountryBottomSheet(BuildContext context){
    void _countrymodalBottomSheetMenu() {
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
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            AppLocalization.of(context)
                                .getTranslatedValue("country")
                                .toString(),
                            style: lightThemetitleStyle,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(Icons.clear,color: Colors.black,size: 25,),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Center(
                                child: Text(
                                  "Kuwait (KWD)",
                                   style:lightThemenormalStyle,
                                )),
                            Icon(Icons.check_circle_outline,size: 25,),
                          ],),
                      ),
                    ],
                  ),
                ),
              ),
            );
          });
    }
    return  InkWell(
      onTap: _countrymodalBottomSheetMenu,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppLocalization.of(context)
                  .getTranslatedValue("country")
                  .toString(),
              style: lightThemenormalStyle,
            ),
            //  SizedBox(width: size.width*0.46),
            Icon(
              Icons.arrow_forward_ios,
              size: 24,
            ),
          ],
        ),
      ),
    );
  }


Widget ABCountryBottomSheet(BuildContext context){
  void _countrymodalBottomSheetMenu() {
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
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          AppLocalization.of(context)
                              .getTranslatedValue("country")
                              .toString(),
                          style: lightThemetitleStyle,
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.clear,color: Colors.black,size: 25,),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Center(
                              child: Text(
                                "Kuwait (KWD)",
                                style:lightThemenormalStyle,
                              )),
                          Icon(Icons.check_circle_outline,size: 25,),
                        ],),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
  return  InkWell(
    onTap: _countrymodalBottomSheetMenu,
    child:  Container(
      width: MediaQuery.of(context).size.height * .08,
      height:MediaQuery.of(context).size.width * .08,
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/Country@3x.png')),
        shape: BoxShape.circle,
      ),
    )
  );
}



