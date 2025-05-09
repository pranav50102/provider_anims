import 'package:anim34/providers/cart_provider.dart';
import 'package:anim34/providers/product_provider.dart';
import 'package:anim34/providers/user_provider.dart';
import 'package:anim34/shared/product.dart';
import 'package:flutter/material.dart';
import 'package:anim34/providers/product_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:anim34/pages/item.dart';


class Home extends ConsumerStatefulWidget {
  const Home({super.key});

  @override
  ConsumerState<Home> createState() => _HomeState();
}

class _HomeState extends ConsumerState<Home> {
  int log = 0;


  @override
  Widget build(BuildContext context) {
    final products = ref.watch(productsProvider);
    final cartProduct = ref.watch(cartNotifierProvider);
    final user = ref.watch(userNotifierProvider);
    // data =ModalRoute.of(context)!.settings.arguments as Map;
    // bool islog = data.isEmpty ? false : data['isLog'];
    int k = products.length;
    int l = cartProduct.length;


    return SafeArea(
      child: Scaffold(
        drawer: NavigationDrawer(
          backgroundColor: Colors.purple[500],
          children: [
            SizedBox(
              height: 61,
            ),
            Image(
                image: AssetImage('assets/cart.jpg'),
            ),

            SizedBox(
              height: 600,
              child: Container(
                color: Colors.grey[300],
                child: Column(
                  children: [
                    SizedBox(
                      height: 62,
                      child: Container(
                      ),
                    ),
                    Container(
                      color: Colors.white,
                      child: Column(
                        children: [
              
                      Material(
                      type: MaterialType.transparency,
                        child: ListTile(
                        leading: Icon(Icons.login),
                        onTap: () {
                          Navigator.pushNamed(context, '/loginm');
                        },
                        title: Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                        ),
                      ),
                            SizedBox(height: 2,
                            child: Container(color: Colors.grey,),
                            ),
                            Material(
                              child: ListTile(
                                leading: Icon(Icons.account_box),
                                onTap: () {
                                       Navigator.pushNamed(context, '/login');
                                },
                                title: Text(
                                                  'Signup',
                                                  style: TextStyle(
                                                    fontSize: 20.0,
                                                  ),
                                ),
                              ),
                            ),
                          SizedBox(height: 2,
                            child: Container(color: Colors.grey,),
                          ),
                            Material(
                              child: ListTile(
                                leading: Icon(Icons.settings),
                                onTap: () {
                                            
                                },
                                title: Text(
                                                  'Settings',
                                                  style: TextStyle(
                                                    fontSize: 20.0,
                                                  ),
                                ),
                              ),
                            ),
                          SizedBox(height: 2,
                            child: Container(color: Colors.grey,),
                          ),
                            
                            Material(
                              child: ListTile(
                                leading: Icon(Icons.logout),
                                onTap: () {
                                            
                                },
                                title: Text(
                                                  'Logout',
                                                  style: TextStyle(
                                                    fontSize: 20.0,
                                                  ),
                                ),
                              ),
                            ),
              
              
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        backgroundColor: Colors.grey[100],
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBar(
            backgroundColor: Colors.purple[500],
            actions: [
              IconButton(
                  onPressed: (){
                    Navigator.pushNamed(context, '/cart');
                  },
                  icon : Icon(Icons.shopping_cart,
                  color: Colors.black,
                  ),
              ),
            ],
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/skytowers.jpg'),
            fit: BoxFit.cover,
            )
          ),
          child: GridView.builder(
            padding: EdgeInsets.symmetric(vertical: 20,horizontal: 5),
            itemCount: products.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15 ,
                crossAxisSpacing: 10,
                mainAxisExtent: 210,
              ),
              itemBuilder: (context,index){

                     return SizedBox(
                       height: 300,
                       width: 100,
                       child: Material(
                         color: Colors.grey.withOpacity(0.4),
                         child: ListTile(
                           onTap: (){
                             Navigator.push(context, MaterialPageRoute(builder: (context) => Item(product: products[index],)));
                           },
                           tileColor: Colors.transparent,
                           title: Column(
                             children: [
                               SizedBox(
                                 height: 120,
                                 width: 200,
                                 child: Container(
                                     padding: EdgeInsets.all(5),
                                     child: Hero(
                                       tag: 'Image${products[index].img}',
                                       child: Image.asset(products[index].img,
                                         fit: BoxFit.fill,
                                                                      ),
                                     )),
                               ),
                               Text(
                                 products[index].name,
                                 style: TextStyle(
                                   fontSize: 18,
                                   fontWeight: FontWeight.bold,
                                 ),
                               ),
                               Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                 children: [
                                   Container(
                                     padding: EdgeInsets.only(left: 10),
                                     child: Text(
                                       'Rs.${products[index].price.toString()}',
                                       style: TextStyle(
                                         fontSize: 15,
                                         fontWeight: FontWeight.bold,
                                       ),
                                     ),
                                   ),
                                     if(ref.read(cartNotifierProvider.notifier)
                                         .isThere(products[index].name,products[index].img,products[index].price))
                                       IconButton(
                                       onPressed: () {
                                         setState(() {
                                           ref.read(cartNotifierProvider.notifier)
                                               .removeProduct(products[index]);
                                         });
                                       },
                                       icon: Icon( Icons.remove_shopping_cart_outlined ),
                                     ),
                                   if(!ref.read(cartNotifierProvider.notifier)
                                       .isThere(products[index].name,products[index].img,products[index].price))
                                     IconButton(
                                       onPressed: () {
                                         setState(() {
                                           ref.read(cartNotifierProvider.notifier)
                                               .addProduct(products[index]);
                                         });
                                       },
                                       icon: Icon( Icons.add_shopping_cart_rounded ),
                                     ),

                                 ],
                               ),
                             ],
                           ),
                         ),
                       ),
                     );
              },),
        ),
      ),
    );
  }
}
