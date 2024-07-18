// favorite_screen.dart
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tezda_assesment/modules/home/provider/favourite_provider.dart';


class FavoriteScreen extends ConsumerWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteProducts = ref.watch(favoriteProductsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorite Products'),
      ),
      body: favoriteProducts.isEmpty
          ? const Center(child: Text('No favorite products yet.'))
          : ListView.builder(
              itemCount: favoriteProducts.length,
              itemBuilder: (context, index) {
                final favoriteProduct = favoriteProducts.elementAt(index);

                return ListTile(
                  title: Text(favoriteProduct.title),
                  subtitle: Text(favoriteProduct.price.toString()),
                  leading: Image.network(favoriteProduct.thumbnail),
                  onTap: () {
                    // Navigate to the detail screen if needed
                  },
                );
              },
            ),
    );
  }
}