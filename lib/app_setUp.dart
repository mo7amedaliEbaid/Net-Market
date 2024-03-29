import 'package:flutter/material.dart';
import 'package:net_market/services/localization.dart';
import 'package:net_market/ui/screens/account_screens/account_screen.dart';
import 'package:net_market/ui/screens/cart_screen/cart_screen.dart';
import 'package:net_market/ui/screens/categories_screen/MianCategories_screen.dart';
import 'package:net_market/ui/screens/home_screen/home_screen.dart';
import 'package:net_market/ui/screens/order_screen/order_screen.dart';
class AppSetUp extends StatefulWidget {
  const AppSetUp({Key? key}) : super(key: key);

  @override
  State<AppSetUp> createState() => _AppSetUpState();
}

class _AppSetUpState extends State<AppSetUp> {
  int _selectedIndex = 0;


  static const List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    MainCategoriesScreen(),
    OrderScreen(),
    CartScreen(),
    AccountScreen(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        centerTitle: true,
        title: Text('Store Name'),
      ),*/
      bottomNavigationBar: Container(
        height: 80,
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: Colors.black, width: 1.0),
          ),),
        child: BottomNavigationBar(

          /* elevation: 5,
          backgroundColor: Colors.red,
          fixedColor: Colors.red,*/
            items:  <BottomNavigationBarItem>[
               BottomNavigationBarItem(
                activeIcon: Icon(Icons.home),
                icon:Icon(Icons.home_outlined),
                label: AppLocalization.of(context)
                    .getTranslatedValue("home")
                    .toString(),
                backgroundColor: Colors.white,
              ),
              const BottomNavigationBarItem(
                activeIcon: Icon(Icons.category),
                icon:Icon(Icons.category_outlined),
                label: 'Categories',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.business_outlined,),
                activeIcon: Icon(Icons.business),
                label: 'Order Status',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag_outlined),
                activeIcon: Icon(Icons.shopping_bag),
                label: 'Cart',
              ),
              const BottomNavigationBarItem(
                icon: Icon(Icons.manage_accounts_outlined),
                label: 'My Account',
                activeIcon: Icon(Icons.manage_accounts),
              ),
            ],
            type: BottomNavigationBarType.shifting,
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.blue,
            unselectedItemColor: Colors.blue,
            iconSize: 35,
            onTap: _onItemTapped,
            elevation: 50
        ),
      ),
      body:  Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
    );
  }
}