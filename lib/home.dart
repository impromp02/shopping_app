import 'package:flutter/material.dart';
import 'package:shopping_app/cart_screen.dart';
import 'package:shopping_app/home_product_list.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        selectedFontSize: 0,
        unselectedFontSize: 0,
        selectedItemColor: Colors.yellow.shade600,
        onTap: (value) {
          setState(() {
            currentPage = value;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              size: 36,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: '',
          ),
        ],
      ),
      body: IndexedStack(
        index: currentPage,
        children: const [HomeProductList(), CartScreen()],
      ),
    );
  }
}
