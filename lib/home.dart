import 'package:flutter/material.dart';
import 'package:shopping_app/global_constants.dart';
import 'package:shopping_app/global_constants.dart';
import 'package:shopping_app/product_card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> filters = ['All', 'Nike', 'Addidas', 'Puma', 'Bata'];
  late String selectedFilter = filters[0];
  @override
  Widget build(BuildContext context) {
    const inputBorder = OutlineInputBorder(
        borderSide: BorderSide(),
        borderRadius: BorderRadius.horizontal(
          left: Radius.circular(50),
        ));
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    'Shoes\nCollection',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 34,
                    ),
                  ),
                ),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        hintText: 'Search',
                        prefixIcon: Icon(Icons.search),
                        border: inputBorder,
                        enabledBorder: inputBorder,
                        focusedBorder: inputBorder),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 80,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: filters.length,
                itemBuilder: (BuildContext context, int index) {
                  final currentFilter = filters[index];
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 6, vertical: 0),
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedFilter = currentFilter;
                        });
                      },
                      child: Chip(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50)),
                        backgroundColor: selectedFilter == currentFilter
                            ? const Color.fromRGBO(255, 244, 79, 1)
                            : Theme.of(context).colorScheme.primary,
                        label: Text(currentFilter),
                        labelStyle: const TextStyle(fontSize: 16),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 12),
                      ),
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    final currentProduct = products[index];
                    return ProductCard(
                      product: currentProduct,
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
