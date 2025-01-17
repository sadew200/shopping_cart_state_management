import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../cart.dart';

class MobileNavBar extends StatefulWidget {
  @override
  State<MobileNavBar> createState() {
    return _NavBar();
  }
}

class _NavBar extends State<MobileNavBar> {
  var _searchBarBG = WidgetStatePropertyAll(Colors.yellowAccent);

  @override
  Widget build(BuildContext context) {
    var currentWidth = MediaQuery.of(context).size.width;

    return Container(
      width: double.infinity,
      height: 105,
      color: Colors.black,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(left: 20, top: 5),
                child: Image.asset(
                  "assets/image/logo.png",
                  width: 130,
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: currentWidth * 0.10),
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
            ],
          ),
          Container(
            margin: EdgeInsets.only(left: 20),
            child: Row(
              children: [
                Container(
                  width: currentWidth * 0.70,
                  height: 35,
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
                  width: currentWidth * 0.20,
                  child:
                  GestureDetector(
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
