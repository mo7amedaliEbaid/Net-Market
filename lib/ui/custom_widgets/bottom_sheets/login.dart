import 'package:flutter/material.dart';
import 'package:net_market/ui/custom_widgets/bottom_sheets/register.dart';
import '../../../const/global_constants.dart';
import '../../../services/localization.dart';

Widget LoginBottomSheet(BuildContext context) {
  Size size =MediaQuery.of(context).size;
  void _countrymodalBottomSheetMenu() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (builder) {
        return Container(
          height: size
              .height * .75,
          color: Colors.transparent,
          child: new Container(
            decoration: new BoxDecoration(
                color: Colors.white,
                borderRadius: new BorderRadius.only(
                    topLeft: const Radius.circular(25.0),
                    topRight: const Radius.circular(25.0))),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30, 30, 30, 30),
              child: SingleChildScrollView(
                    child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(AppLocalization.of(context)
                                .getTranslatedValue("login")
                                .toString(),
                                style: lightThemetitleStyle,
                               ),
                            InkWell(
                              onTap:(){ Navigator.pop(context);},
                              child: Icon(Icons.clear_sharp,size: 24,color: Colors.black,),
                            )
                          ],
                        ),
                        SizedBox(height: size.height*.04,),
                        Text(AppLocalization.of(context)
                            .getTranslatedValue("email")
                            .toString(),
                          style: lightThemenormalStyle,),
                        SizedBox(height: size.height*.01,),
                         Container(
                             height: size.height*.08,
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(10),
                             border: Border.all(color: Colors.green,width: 2),
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
                        SizedBox(height: size.height*.04,),
                        Text(AppLocalization.of(context)
                            .getTranslatedValue("password")
                            .toString(),
                          style:lightThemenormalStyle,),
                        SizedBox(height: size.height*.01,),
                        Container(
                          height: size.height*.08,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                           border: Border.all(color: Colors.green,width: 2),
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
                                  fontWeight: FontWeight.w400
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              border: InputBorder.none,
                              hintText:AppLocalization.of(context)
                                  .getTranslatedValue("type_your_password")
                                  .toString(),
                            ),
                        ),),
                        /* suffixIcon: IconButton(
                          onPressed: _toggle,
                          icon: Icon(_obscureText ? Icons.visibility_off : Icons
                              .visibility))),
                  obscureText: _obscureText,
                ),*/

                        SizedBox(
                          height: size.height*.04,
                        ),
                        InkWell(
                          onTap: () {
                            /* setState(() {
                      ontapLogin();
                    });*/
                          },
                          child: Container(
                            height: size.height*.08,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(15)),
                            child: Center(
                              child: Text(
                                AppLocalization.of(context)
                                    .getTranslatedValue("login")
                                    .toString(),
                                style: bigwhite,),
                              ),
                            ),
                          ),
                        SizedBox(
                          height: size.height*.04,
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
                          height: size.height*.01,
                        ),
                        RegisterBottomSheet(context),
                       // RegisterBottomSheet(context),
                        SizedBox(
                          height: size.height*.01,
                        ),
                      ],
                    ),


                  ),
            ),
          ),

        );
      });
      }
      return InkWell(
      onTap: _countrymodalBottomSheetMenu,
      child: Container(
        // height: size.height*.085,
        //  width: size.width*.25,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(7),
          color: Colors.white,
        ),
        child: Center(
          child: Text(
            AppLocalization.of(context)
                .getTranslatedValue("login")
                .toString(),
            style:lightThemetitleStyle,
          ),
        ),
      ),
    );
  }


