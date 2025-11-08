import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_state_management/notifier/product_notifier.dart';

class CartScreen extends ConsumerWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    //with ref.read
    final cartItems =ref.read(productNotifier.notifier).selectedproduct;


    //with ref.watch
    // final cartItems = ref.watch(productNotifier.select((State) => State.where((product) => product.isSelected,).toList())
    // );

    return Scaffold(
      appBar: AppBar(title: Text('Cart')),
      body: cartItems.isEmpty
          ? Center(child: Text('Your cart is empty'))
          : ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) { 
                final product = cartItems[index];
                return ListTile(
                  leading: CircleAvatar(
                    backgroundColor: product.color,
                    child: Text(
                      product.name[0],
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  title: Text(product.name),
                  subtitle: Text(product.description),
                  trailing: Text('\$${product.price.toStringAsFixed(2)}'),
                );
              },
            ),
    );
  }
}
