// favorite_products_provider.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tezda_assesment/modules/home/model/products.dart';
import 'package:tezda_assesment/modules/home/repository/favorite_repository.dart';

// Create the repository instance
final favoriteProductsRepositoryProvider =
    Provider<FavoriteProductsRepository>((ref) => FavoriteProductsRepository());

// Define a provider for the favorite state
final favoriteProductsProvider =
    StateNotifierProvider<FavoriteProductsNotifier, Set<Product>>(
  (ref) => FavoriteProductsNotifier(),
);

// A simple notifier to manage favorite products
class FavoriteProductsNotifier extends StateNotifier<Set<Product>> {
  FavoriteProductsNotifier() : super(<Product>{});

  void toggleFavorite(Product product) {
    if (state.contains(product)) {
      state = {...state}..remove(product);
    } else {
      state = {...state, product};
    }
  }
}