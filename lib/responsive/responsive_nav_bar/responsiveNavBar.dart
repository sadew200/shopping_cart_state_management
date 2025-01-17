import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_cart_state_management/responsive/responsive_nav_bar/desktopNavBar.dart';
import 'package:shopping_cart_state_management/responsive/responsive_nav_bar/mobileNavBr.dart';
import 'package:shopping_cart_state_management/responsive/responsive_nav_bar/tabletNavBar.dart';

class ResponsiveNavBar extends StatefulWidget{
  @override
  State<ResponsiveNavBar> createState() {
    return _ResponsiveNavBar();
  }


}

class _ResponsiveNavBar extends State<ResponsiveNavBar>{
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context,constraints){

          if(constraints.maxWidth>=1250){
          return DesktopNavBar();
          }
          else if(constraints.maxWidth>=700){
            return TabletNavBar();
          }
          else{
            return MobileNavBar();
          }


        }
    );
    
    

  }
}