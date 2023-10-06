import 'package:flutter/material.dart';
import 'package:shopping_app/global_constants.dart';
import 'package:shopping_app/home.dart';
import 'package:shopping_app/product_details.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shopping App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Lato',
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.yellow,
          primary: const Color.fromRGBO(216, 240, 253, 0.3),
        ),
        inputDecorationTheme: const InputDecorationTheme(
          hintStyle: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        appBarTheme: const AppBarTheme(
            titleTextStyle: TextStyle(fontSize: 20, color: Colors.black),
            elevation: 0,
            backgroundColor: Colors.transparent),
      ),
      home: ProdcutDetails(
        product: products[0],
      ),
    );
  }
}
