import 'package:anim34/shared/product.dart';
import 'package:flutter/material.dart';
import 'package:anim34/shared/product.dart';
import 'package:anim34/shared/heart.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/cart_provider.dart';
import '../providers/product_provider.dart';

class Item extends StatelessWidget {
  // const Item({super.key});
   final Product product ;

  Item({required this.product});

  @override
  Widget build(BuildContext context) {

    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBar(
            backgroundColor: Colors.orange,
          ),
        ),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(30),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 30,horizontal: 30),
              color: Colors.grey[400],
              child: Column(
                children: [
                  SizedBox(
                    height: 200,
                    width: 300,
                    child: Hero(
                      tag: 'Image${product.img}',
                      child: Image.asset(
                        '${product.img}',
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        product.name.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                      Container(
                        child: Heart(),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Rs :- ${product.price.toString()}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),

                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 280,
                    width: 300,
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 8,horizontal: 10),
                      color: Colors.grey[500],
                      child: Text(
                        'Description',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}




