import 'package:flutter/material.dart';
import 'package:flutter_state_management/feature/cart/screens/cart_screen.dart';
import 'package:flutter_state_management/feature/product/constants/product_constant.dart';
import 'package:flutter_state_management/feature/product/widgets/product_tile.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
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
                  builder: (_) => CartScreen(
                    cartItems: productlist
                        .where((product) => product.isSelected)
                        .toList(),
                  ),
                ),
              );
            },
            icon: Icon(Icons.shopping_cart),
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: productlist.length,
        itemBuilder: (context, index) {
          final product = productlist[index];
          return ProductTile(
            product: product,
            onchanged: (value) {
              setState(() {
                product.isSelected = value ?? false;
              });
            },
          );
        },
      ),
    );
  }
}
