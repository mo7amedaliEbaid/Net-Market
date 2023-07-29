import 'package:flutter/material.dart';
import 'package:net_market/const/api_constants.dart';
import 'package:net_market/const/global_constants.dart';
import 'package:net_market/providers/delivery_provider.dart';
import 'package:net_market/providers/store_provider.dart';
import 'package:net_market/ui/app_widgets/app_bar.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../const/app_constants.dart';

class ContactUsscreen extends StatefulWidget {
  const ContactUsscreen({Key? key}) : super(key: key);

  @override
  State<ContactUsscreen> createState() => _ContactUsscreenState();
}

class _ContactUsscreenState extends State<ContactUsscreen> {
  late DeliveryProvider deliveryProvider;
  Appconstants appconstants = Appconstants();
  Future<void>? _launched;

  @override
  void initState() {
    deliveryProvider = Provider.of<DeliveryProvider>(context, listen: false);
    deliveryProvider.getbranchesbyStoreId();
    super.initState();
  }

  Future<void> _launchInWebViewOrVC(Uri url) async {
    if (!await launchUrl(
      url,
      mode: LaunchMode.inAppWebView,
      webViewConfiguration: const WebViewConfiguration(
          headers: <String, String>{'my_header_key': 'my_header_value'}),
    )) {
      throw Exception('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer2<StoreProvider, DeliveryProvider>(
        builder: (context, storedata, deliverydata, _) {
      return Scaffold(
        appBar: MyAppBar(context, storedata.store.name!, false, true,
            isSearch: false, iscart: true),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(5.0, 5, 10, 5),
                child: Text(
                  "CONTACT US",
                  style: lightThemetitleStyle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(5.0, 0, 10, 5),
                child: Text(
                  "List of our Branches",
                  style: lightThemenormalStyle,
                ),
              ),
              deliverydata.brancheslist.length == 0
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : Container(
                      padding: EdgeInsets.all(10),
                      child: ListView.builder(
                          itemCount: deliverydata.brancheslist.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Container(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                      padding: EdgeInsets.all(5),
                                      width: size.width * .25,
                                      height: size.height * .12,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                              color: Colors.grey, width: 2),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: deliverydata.brancheslist[index]
                                                  .imageUrl ==
                                              null
                                          ? Image.asset(
                                              "assets/bracherror.jpg",
                                              fit: BoxFit.fill,
                                            )
                                          : Image.network(
                                              "${ApiConstants.IMAGE}${deliverydata.brancheslist[index].imageUrl}",
                                              fit: BoxFit.fill,
                                              errorBuilder: (context, error,
                                                      stackTrace) =>
                                                  Image.asset(
                                                      "assets/brokenImage.png"),
                                            )),
                                  Container(
                                    width: size.width * .55,
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      //  mainAxisAlignment: MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          deliverydata.brancheslist[index].name,
                                          style: lightThemetitleStyle,
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Text(
                                          deliverydata
                                              .brancheslist[index].description,
                                          style: lightThemetitleStyle,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        8.0, 20, 8, 15),
                                    child: InkWell(
                                      child: Icon(
                                        Icons.arrow_forward_ios,
                                        size: 20,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          }),
                    ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ...appconstants.social.map((e) => InkWell(
                        onTap: () {
                          setState(() {
                            _launched = _launchInWebViewOrVC(
                                Uri.parse("https://www.facebook.com/"));
                          });
                        },
                        child: Container(
                          margin: EdgeInsets.symmetric(vertical: 40),
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                              //color: Colors.grey.shade500,
                              image: DecorationImage(image: AssetImage(e),fit: BoxFit.fill)),
                          // child: Image.asset(sicon),
                        ),
                      ))
                ],
              )
            ],
          ),
        ),
      );
    });
  }
}
/*Widget buildsocialicon(BuildContext context,String sicon){
return InkWell(
  onTap: ,
  child:   Container(
    margin: EdgeInsets.symmetric(vertical: 40),
    height: 50,
    width: 50,
   decoration: BoxDecoration(
       //color: Colors.grey.shade500,
       image: DecorationImage(image: AssetImage(sicon))
   ),
   // child: Image.asset(sicon),
  ),
);
}*/
