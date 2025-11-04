import 'package:flutter/material.dart';
import 'package:flutter_state_management/feature/cart/screens/cart_screen.dart';

import 'package:flutter_state_management/feature/product/widgets/product_tile.dart';
import 'package:flutter_state_management/providers/product_provider.dart';
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
      body: Consumer<ProduvtProvider>(
        builder: (context, productprovider, child) {
          return ListView.builder(
            itemCount: productprovider.products.length,
            itemBuilder: (context, index) {
              final product = productprovider.products[index];
              return ProductTile(
                product: product,
                onchanged: (value) {
                  productprovider.toggleProductSelection(product);
                },
              );
            },
          );
        },
      ),
    );
  }
}
