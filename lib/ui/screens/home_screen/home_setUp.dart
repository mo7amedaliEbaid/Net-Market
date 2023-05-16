import 'package:flutter/material.dart';
import 'package:net_market/const/global_constants.dart';
import 'package:provider/provider.dart';

import '../../../models/category_model.dart';
import '../../../providers/categories_provider.dart';
import 'singlecategory_widget.dart';


class HomeSetUp extends StatefulWidget {
  HomeSetUp({super.key, required this.mainCategories});
  final List<MainCategory> mainCategories;
  @override
  State<HomeSetUp> createState() =>
      _HomeSetUpState();
}

class _HomeSetUpState
    extends State<HomeSetUp> {
  late CategoriesProvider categoriesProvider;

  int _selectedIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     categoriesProvider =
        Provider.of<CategoriesProvider>(context, listen: false);
   // categoriesProvider.getproductListByCategory(categoryId);
  }


  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
  /* List<Widget> _widgetOptions = <Widget>[
      ...categoriesProvider.maincategories
          .map((e) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 14.0,vertical: 10),
                child: SingleCategory(
                ),
              ))
          .toList(),
    ];*/
    /*List<Widget> _widgetOptions = <Widget>[
      ...widget.mainCategories
          .map((e) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: Text(e.name
        ),
      ))
          .toList(),
    ];*/
    return

      Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
          //  color: Colors.transparent,
            padding: EdgeInsets.symmetric(horizontal: 0),
            height: MediaQuery.of(context).size.height * .09,
           // width: MediaQuery.of(context).size.width * 2,
            child: ListView(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              children: [
                Container(
                  //color: Colors.transparent,
                  //   height: 70,
                  width: MediaQuery.of(context).size.width * 2.8,
                  child: BottomNavigationBar(
                    items: <BottomNavigationBarItem>[
                      ...widget.mainCategories
                          .map((e) => BottomNavigationBarItem(
                           icon: Text("${e.name}",style: lightThemenormalStyle,),
                           label: "________________",
                        activeIcon: InkWell(
                             onTap: (){
                               setState(() {
                                categoriesProvider.getproductListByCategory(e.id);
                               });
                             },
                             child: InkWell(
                               onTap: (){
                                 setState(() {
                                  categoriesProvider.getproductListByCategory(e.id);
                                 });
                               },
                                 child: Text("${e.name}",style: lightThemetitleStyle,))),
                            backgroundColor: Colors.white,
                      ),
                      )
                          .toList(),
                    ],

                   // backgroundColor: Colors.transparent,
                    currentIndex: _selectedIndex,
                    selectedItemColor: Colors.blue,
                    selectedLabelStyle: lightThemetitleStyle,
                    onTap: _onItemTapped,
                  ),
                ),
              ],
            ),
          ),
           SingleCategory()
           /*_widgetOptions.elementAt(_selectedIndex),*/
        ],
      );
  }
}