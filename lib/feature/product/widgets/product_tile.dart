import 'package:flutter/material.dart';
import 'package:flutter_state_management/feature/product/models/product.dart';

class ProductTile extends StatelessWidget {
  final Product product;
  final ValueChanged<bool?> onchanged;
  const ProductTile({
    super.key,
    required this.product,
    required this.onchanged,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onchanged(!product.isSelected);
      },
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: product.color,
          child: Text(product.name[0], style: TextStyle(color: Colors.white)),
        ),
        title: Text(
          product.name,
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        subtitle: Text(product.description),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '\$${product.price.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 15),
            ),
            Checkbox(value: product.isSelected, onChanged: onchanged),
          ],
        ),
      ),
    );
  }
}
