import 'package:flutter/material.dart';
import 'package:shopping_app/global_constants.dart';

class ProdcutDetails extends StatefulWidget {
  final Product product;
  const ProdcutDetails({super.key, required this.product});

  @override
  State<ProdcutDetails> createState() => _ProdcutDetailsState();
}

class _ProdcutDetailsState extends State<ProdcutDetails> {
  late int selectedSize = widget.product.sizes[0];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product Details'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            widget.product.title,
            style: const TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Image.asset(widget.product.imageUrl),
          ),
          const Spacer(
            flex: 2,
          ),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
            height: 250,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  '${widget.product.price}',
                  style: const TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 60,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.product.sizes.length,
                      itemBuilder: (context, index) {
                        final currentSize = widget.product.sizes[index];
                        return Padding(
                          padding: const EdgeInsets.all(6),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedSize = currentSize;
                              });
                            },
                            child: Chip(
                              label: Text(currentSize.toString()),
                              backgroundColor: selectedSize == currentSize
                                  ? Colors.yellow.shade600
                                  : Colors.white,
                              padding: const EdgeInsets.all(8),
                              shape: RoundedRectangleBorder(
                                  side: const BorderSide(),
                                  borderRadius: BorderRadius.circular(10)),
                            ),
                          ),
                        );
                      }),
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton.icon(
                  icon: const Icon(
                    Icons.shopping_cart,
                    size: 18,
                    color: Colors.black,
                  ),
                  label: const Text(
                    'Add to Cart',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.yellow.shade600,
                    minimumSize: const Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(40),
                    ),
                  ),
                  onPressed: () {},
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
