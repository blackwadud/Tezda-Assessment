// product_list_screen.dart
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tezda_assesment/modules/home/provider/favourite_provider.dart';
import 'package:tezda_assesment/modules/home/provider/page_provider.dart';
import 'package:tezda_assesment/modules/home/view/screens/favourite_screen.dart';
import 'package:tezda_assesment/modules/home/view/widgets/product_card.dart';


class ProductListScreen extends ConsumerWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productsAsyncValue = ref.watch(productsProvider);
    final favoriteProducts = ref.watch(favoriteProductsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FavoriteScreen()),
              );
            },
          ),
        ],
      ),
      body: productsAsyncValue.when(
        data: (products) {
          if (products.products.isEmpty) {
            return const Center(child: Text('No products available.'));
          }

          return ListView.builder(
            itemCount: products.products.length,
            itemBuilder: (context, index) {
              final product = products.products[index];
              final isFavorite = favoriteProducts.contains(product);

              return ProductCard(product: product, isFavorite: isFavorite);
            },
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stackTrace) {
          log(error.toString());
          return const Center(
              child: Text('An error occurred while fetching products.'));
        },
      ),
    );
  }
}