import 'package:flutter/material.dart';
import 'package:terristore/preOnboarding.dart';
import 'package:terristore/screens/Login.dart';
import 'package:terristore/screens/Register.dart';
import 'package:terristore/screens/homePage.dart';
import 'package:terristore/screens/update_product_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily:'Sen'),
      routes: {
        Register.id :(context) =>Register(),
        Login.id :(context) =>Login(),
        HomePage.id :(context) =>HomePage(),
        UpdateProductPage.id : (context) => UpdateProductPage(),
      },
      debugShowCheckedModeBanner: false,
      home: PreOnboard(),
    );
  }
}