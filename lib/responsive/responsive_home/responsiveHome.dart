import 'package:flutter/cupertino.dart';
import 'package:shopping_cart_state_management/responsive/responsive_home/desktopHome.dart';
import 'package:shopping_cart_state_management/responsive/responsive_home/mobileHome.dart';
import 'package:shopping_cart_state_management/responsive/responsive_home/tabletHome.dart';

class ResponsiveHome extends StatefulWidget{
  @override
  State<ResponsiveHome> createState() {
    return _ResponsiveHome();
  }
}

class _ResponsiveHome extends State<ResponsiveHome>{
  @override
  Widget build(BuildContext context) {
   return LayoutBuilder(builder: (context,constraints){
     if(constraints.maxWidth<500){
       return MobileHome();

     }
     else if(constraints.maxWidth<1200){
        return TabletHome();
     }
     else{
       return DesktopHome();
     }
   });
  }
}