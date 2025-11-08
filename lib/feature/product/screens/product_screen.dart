import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_state_management/feature/cart/screens/cart_screen.dart';
import 'package:flutter_state_management/feature/product/widgets/product_tile.dart';
import 'package:flutter_state_management/notifier/product_notifier.dart';

class ProductScreen extends ConsumerWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => CartScreen()),
              );
            },
            icon: Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: ref.watch(productNotifier).length,
        itemBuilder: (context, index) {
          final product = ref.watch(productNotifier)[index];
          return ProductTile(
            product: product,
            onchanged: (value) {
              ref.read(productNotifier.notifier).toggleProductSelected(product);
            },
          );
        },
      ),
    );
  }
}
