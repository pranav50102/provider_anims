import 'dart:collection';

import 'package:anim34/shared/product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

List<Product>  products = [
  Product(name: 'Laptop', img: 'assets/laptop.jpg',price: 50000),
  Product(name: 'PC', img: 'assets/pc.jpg',price: 70000),
  Product(name: 'Phone', img: 'assets/phone.jpg',price: 15000),
  Product(name: 'Shoe', img: 'assets/shoe.jpg',price: 5000),
  Product(name: 'TV', img: 'assets/tv.jpg',price: 60000),
  Product(name: 'Bag', img: 'assets/bag.jpg',price: 1000),
  Product(name: 'Pen', img: 'assets/pen.jpg',price: 1000),
  Product(name: 'Keyboard', img: 'assets/keyboard.jpg',price: 1000),
];

final productsProvider = Provider((ref) {
       return products;
});