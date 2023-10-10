import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/cart_model_provider.dart';
import 'package:shopping_app/global_constants.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Review Your items'),
      ),
      body: Consumer<CartModel>(
        builder: ((context, cart, _) => ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (context, index) {
                final CartItem(:title, :company, :size, :imageUrl) =
                    cart.items[index];
                return ListTile(
                  leading: Image.asset(imageUrl),
                  title: Text(title),
                  subtitle: Text('$company - $size'),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red.shade400,
                    ),
                    onPressed: () {
                      cart.remove(cart.items[index]);
                    },
                  ),
                );
              },
            )),
      ),
    );
  }
}
