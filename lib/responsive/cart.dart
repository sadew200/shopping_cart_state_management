import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_cart_state_management/service/cartService.dart';

class Cart extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _Cart();
  }

}
class _Cart extends State<Cart>{
  @override
  Widget build(BuildContext context) {
    var currentWidth = MediaQuery.of(context).size.width;

  return Scaffold(
    appBar: AppBar(
      title: Text("Cart"),
      backgroundColor: Colors.blue,
    ),
    body:SingleChildScrollView(
    child:
    Column(
children: [


Container(
  padding: EdgeInsets.all(40),
    child:
        Table(
        border: TableBorder.all(), // Adds a border around the table
    children: [

      TableRow(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Item ID', style: TextStyle(fontWeight: FontWeight.bold,fontSize: currentWidth<600 ?10 : 20)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Name', style: TextStyle(fontWeight: FontWeight.bold,fontSize: currentWidth<600 ?10 : 20)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Price', style: TextStyle(fontWeight: FontWeight.bold,fontSize: currentWidth<600 ?10 : 20)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Description', style: TextStyle(fontWeight: FontWeight.bold,fontSize: currentWidth<600 ?10 : 20)),
          ),
        ],
      ),


      ...List.generate(CartService.loadCartFromStorage().length, (index) {
        return TableRow(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(CartService.loadCartFromStorage()[index]["id"].toString(), style: TextStyle(fontSize: currentWidth<600 ?5 : 18)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(CartService.loadCartFromStorage()[index]["title"], style: TextStyle(fontSize: 18)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(CartService.loadCartFromStorage()[index]["price"].toString()+" \$", style: TextStyle(fontSize: currentWidth<600 ?5 : 18)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(CartService.loadCartFromStorage()[index]["description"], style: TextStyle(fontSize: currentWidth<600 ?5 : 18)),
            ),
          ],
        );
      }),

      ],
        ),
),

  Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      ElevatedButton(

          onPressed: (){


            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text("Successful"),
                  content: Text("Your order has been successfully placed."),
                  actions: [
                    TextButton(
                      child: Text("OK"),
                      onPressed: () {
                        Navigator.of(context).pop();  // Close the dialog
                      },
                    ),
                  ],
                );
              },
            );



          },
          child: Text(
              "Buy",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: currentWidth<600? 20 : 30,
          ),
          ),
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(Colors.orange),
          padding: WidgetStatePropertyAll(EdgeInsets.only(left: currentWidth<600 ? 20: 40,right: currentWidth<600 ? 20: 40,top: 10,bottom: 10)),
        ),
      ),
    SizedBox(width: currentWidth*0.20,),
      ElevatedButton(
        onPressed: (){
          setState(() {
            CartService.clearStoredCart();
          });

        },
        child: Text(
          "Clear",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: currentWidth<600? 20 : 30,
          ),
        ),
        style: ButtonStyle(
          backgroundColor: WidgetStatePropertyAll(Colors.blue),
          padding: WidgetStatePropertyAll(EdgeInsets.only(left: currentWidth<600 ? 20: 40,right: currentWidth<600 ? 20: 40,top: 10,bottom: 10)),
        ),
      ),


    ],
  ),



    ],

    ),
    ),
  );
  }

}