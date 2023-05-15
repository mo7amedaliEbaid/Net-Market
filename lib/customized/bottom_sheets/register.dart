import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:net_market/const/app_constants.dart';
import 'package:net_market/const/api_constants.dart';
import 'package:net_market/theme/theme_data.dart';
import '../../const/global_constants.dart';
import '../../services/localization.dart';

Widget RegisterBottomSheet(BuildContext context) {
  Size size = MediaQuery.of(context).size;
  void _countrymodalBottomSheetMenu() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (builder) {
          return StatefulBuilder(builder: (context, setState) {
            return Container(
                height: size.height * .8,
                color: Colors.transparent,
                child: new Container(
                    decoration: new BoxDecoration(
                        color: Colors.white,
                        borderRadius: new BorderRadius.only(
                            topLeft: const Radius.circular(25.0),
                            topRight: const Radius.circular(25.0))),
                    child: Padding(
                        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    AppLocalization.of(context)
                                        .getTranslatedValue("create_account")
                                        .toString(),
                                    style: lightThemetitleStyle,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Icon(
                                      Icons.clear_sharp,
                                      size: 24,
                                      color: Colors.black,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: size.height * .04,
                              ),
                              Text(
                                AppLocalization.of(context)
                                    .getTranslatedValue("country")
                                    .toString(),
                                style: lightThemenormalStyle,
                              ),
                              Container(
                                margin: EdgeInsets.fromLTRB(0,7,0,20),
                               height: size.height * .08,
                                width: size.width * .9,
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton2(
                                    isExpanded: true,
                                    hint: Row(
                                      children: [
                                        SizedBox(
                                          width: 15,
                                        ),
                                        Expanded(
                                          child: Text(
                                            'Select Your country',
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                    items:Appconstants.countries
                                        .map((item) => DropdownMenuItem<String>(
                                              value: item,
                                              child: Text(
                                                item,
                                                style:lightThemenormalStyle,
                                                overflow: TextOverflow.ellipsis,
                                              ),
                                            ))
                                        .toList(),
                                    value: Appconstants.secselectedValue,
                                    onChanged: (value) {
                                      setState(() {
                                        Appconstants.secselectedValue =
                                            value as String;
                                      });
                                    },
                                    buttonStyleData: ButtonStyleData(
                                      height: 150,
                                      width: 100,
                                      padding: const EdgeInsets.only(
                                          left: 14, right: 14),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                          color: Colors.green,
                                          width: 2
                                        ),
                                        color: Colors.white,
                                      ),
                                      elevation: 0,
                                    ),
                                    iconStyleData: const IconStyleData(
                                      icon: Icon(
                                        Icons.keyboard_arrow_down_sharp,
                                        size: 40,
                                        color: Colors.blue,
                                      ),
                                     /* iconSize: 25,
                                      iconEnabledColor: Colors.black,
                                      iconDisabledColor: Colors.grey,*/
                                    ),
                                    dropdownStyleData: DropdownStyleData(
                                      maxHeight: 200,
                                      width: 200,
                                      padding: null,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(14),
                                        color: Colors.white,
                                      ),
                                      elevation: 2,
                                      offset: const Offset(150, 0),
                                      scrollbarTheme: ScrollbarThemeData(
                                        radius: const Radius.circular(40),
                                        thickness:
                                            MaterialStateProperty.all<double>(
                                                6),
                                        thumbVisibility:
                                            MaterialStateProperty.all<bool>(
                                                true),
                                      ),
                                    ),
                                    menuItemStyleData: const MenuItemStyleData(
                                      height: 40,
                                      padding:
                                          EdgeInsets.only(left: 14, right: 14),
                                    ),
                                  ),
                                ),
                              ),
                              Container(
                                height: size.height * .08,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border:
                                      Border.all(color: Colors.green, width: 2),
                                ),
                                child: TextFormField(
                                  validator: (String? value) {
                                    if (value == null) {
                                      return 'Please Enter Your Required UserName';
                                    } else if (value.isEmpty) {
                                      return 'Please Enter Your Required Password';
                                    }
                                  },
                                  // controller: emailController,
                                  decoration: InputDecoration(
                                    errorStyle: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                    hintText: AppLocalization.of(context)
                                        .getTranslatedValue("enter_your_email")
                                        .toString(),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: size.height * .04,
                              ),
                              Text(
                                AppLocalization.of(context)
                                    .getTranslatedValue("password")
                                    .toString(),
                                style: lightThemenormalStyle,
                              ),
                              SizedBox(
                                height: size.height * .01,
                              ),
                              Container(
                                height: size.height * .08,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border:
                                      Border.all(color: Colors.green, width: 2),
                                ),
                                child: TextFormField(
                                  validator: (String? value) {
                                    if (value == null) {
                                      return 'Please Enter Your Required Password';
                                    } else if (value.isEmpty) {
                                      return 'Please Enter Your Required Password';
                                    }
                                  },
                                  // controller: passwordController,
                                  decoration: InputDecoration(
                                    errorStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: InputBorder.none,
                                    hintText: AppLocalization.of(context)
                                        .getTranslatedValue(
                                            "type_your_password")
                                        .toString(),
                                  ),
                                ),
                              ),
                              Text(
                                AppLocalization.of(context)
                                    .getTranslatedValue("password")
                                    .toString(),
                                style:lightThemenormalStyle,
                              ),
                              SizedBox(
                                height: size.height * .01,
                              ),
                              Container(
                                height: size.height * .08,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border:
                                      Border.all(color: Colors.green, width: 2),
                                ),
                                child: TextFormField(
                                  validator: (String? value) {
                                    if (value == null) {
                                      return 'Please Enter Your Required Password';
                                    } else if (value.isEmpty) {
                                      return 'Please Enter Your Required Password';
                                    }
                                  },
                                  // controller: passwordController,
                                  decoration: InputDecoration(
                                    errorStyle: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: InputBorder.none,
                                    hintText: AppLocalization.of(context)
                                        .getTranslatedValue(
                                            "type_your_password")
                                        .toString(),
                                  ),
                                ),
                              ),
                              /* suffixIcon: IconButton(
                          onPressed: _toggle,
                          icon: Icon(_obscureText ? Icons.visibility_off : Icons
                              .visibility))),
                  obscureText: _obscureText,
                ),*/

                              SizedBox(
                                height: size.height * .04,
                              ),
                              InkWell(
                                onTap: () {
                                  /* setState(() {
                      ontapLogin();
                    });*/
                                },
                                child: Container(
                                  height: size.height * .08,
                                  decoration: BoxDecoration(
                                      color: Colors.blue,
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Center(
                                    child: Text(
                                      AppLocalization.of(context)
                                          .getTranslatedValue("login")
                                          .toString(),
                                      style:bigwhite,
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: size.height * .04,
                              ),

                              Center(
                                child: InkWell(
                                  child: Text(
                                    AppLocalization.of(context)
                                        .getTranslatedValue("forgot_pass")
                                        .toString(),
                                    style: lightThemetitleStyle,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: size.height * .01,
                              ),
                              // RegisterBottomSheet(context),
                              SizedBox(
                                height: size.height * .01,
                              ),
                            ],
                          ),
                        ))));
          });
        });
  }

  return InkWell(
    onTap: () {
      _countrymodalBottomSheetMenu();
      //Navigator.pop(context);
    },
    child: Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            AppLocalization.of(context)
                .getTranslatedValue("dont_have_account")
                .toString(),
            style: lightThemenormalStyle,
          ),
          Text(
            AppLocalization.of(context)
                .getTranslatedValue("register")
                .toString(),
            style: lightThemetitleStyle,
          ),
        ],
      ),
    ),
  );
}
