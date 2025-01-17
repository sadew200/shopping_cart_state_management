import 'dart:convert';

import 'package:http/http.dart' as http;

class FetchData{
 static  List offers=[];
 static  List products=[];


void fetch() async {
  var url=Uri.parse("https://fakestoreapi.com/products?limit=15");
    var res= await http.get(url);
    offers=await jsonDecode(res.body);


  var url1=Uri.parse("https://fakestoreapi.com/products?sort=desc");
  var res1= await http.get(url1);
  products=await jsonDecode(res1.body);

  }
}