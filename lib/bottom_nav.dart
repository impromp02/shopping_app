import 'package:flutter/material.dart';
import 'package:shopping_app/cart_screen.dart';
import 'package:shopping_app/home_product_list.dart';

class BottomNav extends StatelessWidget {
  const BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    return const IndexedStack(
      // index: currentPage,
      children: [HomeProductList(), CartScreen()],
    );
  }
}
