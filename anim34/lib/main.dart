import 'package:anim34/pages/login.dart';
import 'package:anim34/pages/loginM.dart';
import 'package:flutter/material.dart';
import 'package:anim34/pages/home.dart';
import 'package:anim34/pages/cart.dart';
import 'package:anim34/pages/item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(
    ProviderScope(
      child: MaterialApp(
        theme: ThemeData(
            checkboxTheme: CheckboxThemeData(
              checkColor: MaterialStateProperty.all(Colors.green),
              fillColor: MaterialStateProperty.all(Colors.white),
            )
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/' : (context) => Home(),
          '/cart' : (context) => Cart(),
          // '/item' : (context) => Item(),
          '/login'  : (context) => Login(),
          '/loginm'  : (context) => Loginm(),
        },
      
      ),
    )
    );
}
