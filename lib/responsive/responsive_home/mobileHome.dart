import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../model/fetch_data.dart';
import '../../service/cartService.dart';

class MobileHome extends StatefulWidget {
  @override
  State<MobileHome> createState() {
    return _MobileHome();
  }
}

class _MobileHome extends State<MobileHome> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(top: 10, left: 10),
          child: Text(
            "Today's Special Offers",
            style: TextStyle(
                color: Colors.red,
                fontStyle: FontStyle.italic,
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          width: double.infinity,
          height: 300,
          child: GridView.count(
            scrollDirection: Axis.horizontal, // Horizontal scroll direction
            shrinkWrap: true,
            crossAxisCount: 1, // 1 column (because it's horizontal)
            childAspectRatio:
                1.5, // Adjust this to get the desired item aspect ratio
            crossAxisSpacing: 20, // Horizontal spacing between items
            mainAxisSpacing: 20, // Vertical spacing between items
            padding: EdgeInsets.all(10),
            children: List.generate(FetchData.offers.length, (index) {
              return GestureDetector(
                onTap: (){
                  CartService.saveCartToStorage(FetchData.offers[index]);
                },
                child:
              Card(
                color: Colors.teal[100],
                elevation: 50,
                margin: EdgeInsets.all(8),
                child: Column(
                  children: [
                    Image.network(
                      FetchData.offers[index]["image"],
                      width: double.infinity,
                      fit: BoxFit.cover,
                      height: 150,
                    ),
                    Container(
                      padding: EdgeInsets.only(
                          left: 20, right: 20, bottom: 10, top: 10),
                      child: Column(
                        children: [
                          Text(
                            FetchData.offers[index]["title"],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
                      child: Row(
                        children: [
                          Text(
                            FetchData.offers[index]["price"].toString() + " \$",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            FetchData.offers[index]["rating"]["rate"]
                                .toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            Icons.star,
                            color: Colors.orange,
                            size: 20,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              );
            }),
          ),
        ),






        GridView.count(
          shrinkWrap: true,
          crossAxisCount: 2, // 1 column (because it's horizontal)
          childAspectRatio:
          0.8, // Adjust this to get the desired item aspect ratio
          crossAxisSpacing: 20, // Horizontal spacing between items
          mainAxisSpacing: 20, // Vertical spacing between items
          padding: EdgeInsets.all(10),
          children: List.generate(FetchData.products.length, (index) {
            return GestureDetector(
              onTap: (){
                CartService.saveCartToStorage(FetchData.products[index]);
              },
              child:
            Card(
              color: Colors.teal[100],
              elevation: 50,
              margin: EdgeInsets.all(8),
              child: Column(
                children: [
                  Image.network(
                    FetchData.products[index]["image"],
                    width: double.infinity,
                    fit: BoxFit.cover,
                    height: 80,
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        left: 20, right: 20, bottom: 10, top: 10),
                    child: Column(
                      children: [
                        Text(
                          FetchData.products[index]["title"],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 5,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
                    child: Row(
                      children: [
                        Text(
                          FetchData.products[index]["price"].toString() + " \$",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          FetchData.products[index]["rating"]["rate"]
                              .toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 10,
                          ),
                        ),

                        Icon(
                          Icons.star,
                          color: Colors.orange,
                          size: 15,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            );
          }),
        ),






      ],
    );
  }
}
