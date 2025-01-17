import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_cart_state_management/model/fetch_data.dart';

import 'package:shopping_cart_state_management/responsive/responsive_home/ResponsiveHome.dart';
import 'package:shopping_cart_state_management/responsive/responsive_nav_bar/responsiveNavBar.dart';

import 'ChangeE.dart';

Future<void> main() async {

  FetchData().fetch();
  Future.delayed(Duration(seconds: 2),(){
    runApp(MyApp());
  });

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() {
    return _HomePage();
  }
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var currentWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SingleChildScrollView(
    child:
      Column(
        children: [

          //nav_bar
          ResponsiveNavBar(),

          //offers


          ResponsiveHome(),




        ],
      ),
      ),
      bottomNavigationBar: currentWidth >= 1250
          ? null
          : BottomNavigationBar(items: [
              BottomNavigationBarItem(
                backgroundColor: Colors.orange,
                icon: Icon(Icons.home_filled),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.discount),
                label: "Offers",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.call),
                label: "Contact",
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_circle), label: "Login"),
              BottomNavigationBarItem(
                icon: Icon(Icons.add_chart),
                label: "About Us",
              ),
            ]),

    );
  }
}
