import 'package:anim34/providers/cart_provider.dart';
import 'package:anim34/providers/product_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'item.dart';

class Cart extends ConsumerStatefulWidget {
  const Cart({super.key});

  @override
  ConsumerState<Cart> createState() => _CartState();
}

class _CartState extends ConsumerState<Cart> {

  @override
  Widget build(BuildContext context) {
    final cartProducts = ref.watch(cartNotifierProvider).toList();

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBar(
            backgroundColor: Colors.orange[500],
            automaticallyImplyLeading: true,
            title: Row(
              children:
              [
                Text('             '),
                Icon(
                  Icons.shopping_cart,
                ),
                Text('Your Cart',
                  style: TextStyle(
                    letterSpacing: 0.0,
                  ),
                )
              ],
            ),
            centerTitle: true,
          ),
        ),
        body : Container(
          padding: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
          child: ListView.builder(
            itemCount: cartProducts.length,
            itemBuilder: (context,index){
              return Container(
                padding: EdgeInsets.only(bottom: 5),
                child: Material(
                  child: SizedBox(
                    height: 120,
                    child: ListTile(
                      tileColor: Colors.grey[100],
                      title: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text('${index+1}. ',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 80,
                            width: 130,
                            child: Image.asset(
                              '${cartProducts[index].img}',
                              fit: BoxFit.fill,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 35),
                            child: SizedBox(
                              width: 90 ,
                              height: 80,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    cartProducts[index].name,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    'Rs :- ${cartProducts[index].price}',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 50,
                          ),

                          IconButton(
                            onPressed: () {
                              setState(() {
                                ref.read(cartNotifierProvider.notifier)
                                    .removeProduct(cartProducts[index]);
                              });
                            },
                            icon: Icon( Icons.remove_shopping_cart_outlined ),
                          ),

                        ],
                      ),
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Item(product: products[index],)));
                      },
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );

  }
}
