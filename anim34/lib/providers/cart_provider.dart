import 'package:anim34/shared/product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class CartNotifierProvider extends Notifier<Set<Product>> {
  int ct =0;
  @override
  Set<Product> build() {
    return {
    };
  }
  void addProduct(Product product){
 if (!state.contains(product)){
   state = {...state, product};
 }
  }
  void removeProduct(Product product){
    if (state.contains(product)){
      state.remove(product);
    }
  }
  bool isThere(String a,String b, int k){
    state.forEach((element){
      // if(element.name.equals(a) && element.img.equals(b) && element.price == k) {
      //   ct += 1;
      // }
    }
    );
    if(ct>=1){
      ct=0;
      return true;
    }
    else{
      return false;
    }

  }
}


final cartNotifierProvider = NotifierProvider<CartNotifierProvider,Set<Product>>((){
  return CartNotifierProvider();
});