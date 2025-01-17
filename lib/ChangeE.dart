import 'package:flutter/cupertino.dart';

class ChangeE extends ChangeNotifier{
  String v="";
  void ChangeV(String v){
    this.v=v;
    print("s");
    notifyListeners();
  }

}