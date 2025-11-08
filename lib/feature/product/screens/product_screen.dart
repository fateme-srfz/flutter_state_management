import 'package:flutter/material.dart';
import 'package:flutter_state_management/feature/cart/screens/cart_screen.dart';

import 'package:flutter_state_management/feature/product/widgets/product_tile.dart';
import 'package:flutter_state_management/notifier/product_notifier.dart';
import 'package:provider/provider.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => CartScreen(),
                ),
              );
            },
            icon: Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: context.watch<ProduvtProvider>().products.length,
        itemBuilder: (context, index) {
          final product = context.watch<ProduvtProvider>().products[index];
          return ProductTile(
            product: product,
            onchanged: (value) {
              context.read<ProduvtProvider>().toggleProductSelection(product);
            },
          );
        },
      ),
    );
  }
}
