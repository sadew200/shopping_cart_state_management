import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_cart_state_management/responsive/cart.dart';

class DesktopNavBar extends StatefulWidget {
  @override
  State<DesktopNavBar> createState() {
    return _NavBar();
  }
}

class _NavBar extends State<DesktopNavBar> {
  var _searchBarBG = WidgetStatePropertyAll(Colors.yellowAccent);
  @override
  Widget build(BuildContext context) {
    var currentWidth = MediaQuery.of(context).size.width;

    return Container(
      width: double.infinity,
      height: 60,
      color: Colors.black,
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.only(left: 20),
            child: Image.asset(
              "assets/image/logo.png",
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 20),
            child: Row(
              children: [
                Icon(
                  Icons.location_on,
                  color: Colors.white,
                ),
                Text(
                  "Sri Lanka",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 60),
            child: Row(
              children: [
                Container(
                  width: 400,
                  child: NavigationBar(destinations: [
                    NavigationDestination(
                        icon: Icon(Icons.home_filled), label: "Home"),
                    NavigationDestination(
                        icon: Icon(Icons.discount), label: "Today's Deals"),
                    NavigationDestination(
                        icon: Icon(Icons.call), label: "Contact"),
                    NavigationDestination(
                        icon: Icon(Icons.account_circle), label: "Login"),
                    NavigationDestination(
                        icon: Icon(Icons.add_chart), label: "About Us"),
                  ]),
                ),
                SizedBox(
                  width: 40,
                ),
                Container(
                  width: currentWidth*0.25,
                  height: 40,
                  child: SearchBar(
                    leading: const Icon(Icons.search),
                    backgroundColor: _searchBarBG,
                    elevation: WidgetStateProperty.all(5.0),
                    shadowColor: WidgetStateProperty.all(Colors.white),
                    onTap: () {
                      setState(() {
                        _searchBarBG = WidgetStatePropertyAll(Colors
                            .cyanAccent); // Change the background color on tap
                      });
                    },
                    onTapOutside: (e) {
                      setState(() {
                        _searchBarBG = WidgetStatePropertyAll(Colors
                            .yellowAccent); // Change the background color on tap
                      });
                    },
                  ),
                ),
Container(
  width: currentWidth*0.10,
  padding: EdgeInsets.only(left: 10),
  child: GestureDetector(
    onTap: (){
      Navigator.push(
        context,
        MaterialPageRoute(builder:(_)=>Cart()),
      );
    },
    child:
                Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                  size: 40,
                ),
  ),
),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
