import 'package:tezda_assesment/modules/home/model/products.dart';

class FavoriteProductsRepository {
  final Set<Product> _favoriteProducts = {};

  Set<Product> getFavoriteProducts() {
    return _favoriteProducts;
  }

  void toggleFavorite(Product product) {
    if (_favoriteProducts.contains(product)) {
      _favoriteProducts.remove(product);
    } else {
      _favoriteProducts.add(product);
    }
  }
}