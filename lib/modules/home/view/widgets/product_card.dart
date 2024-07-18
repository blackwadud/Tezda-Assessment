import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tezda_assesment/modules/home/data/model/products.dart';
import 'package:tezda_assesment/modules/home/provider/favourite_provider.dart';
import 'package:tezda_assesment/modules/home/view/screens/product_details_screen.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
    required this.isFavorite,
  });

  final Product product;
  final bool isFavorite;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        contentPadding: const EdgeInsets.all(8.0),
        title: Text(
          product.title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '\$${product.price.toString()}',
              style: const TextStyle(color: Colors.green),
            ),
            const SizedBox(height: 4.0),
            Text(product.description),
          ],
        ),
        leading: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            image: DecorationImage(
              image: NetworkImage(product.thumbnail),
              fit: BoxFit.cover,
            ),
          ),
        ),
        trailing: Consumer(
          builder: (context, ref, child) {
            return IconButton(
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                color: isFavorite ? Colors.red : null,
              ),
              onPressed: () {
                log("button clicked");
                ref
                    .read(favoriteProductsProvider.notifier)
                    .toggleFavorite(product);
              },
            );
          },
        ),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  ProductDetailScreen(product: product),
            ),
          );
        },
      ),
    );
  }
}