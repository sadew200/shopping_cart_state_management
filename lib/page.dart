import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ChangeE.dart';

class E extends StatefulWidget{
  String v="";
  E(this.v);
  @override
  State<E> createState() {
    return _Page(v);

  }

}

class _Page extends State<E> {
  String v="";
  _Page(this.v);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Provider.of<ChangeE>(context,listen: false).ChangeV(v);
        print("W");
      },
      child:
          Container(
            margin: EdgeInsets.all(40),
            width: 200,
            height: 50,
            color: Colors.blue,
            child: Text(v),
          ),

    );
  }
}