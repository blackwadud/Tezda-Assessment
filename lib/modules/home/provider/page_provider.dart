import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tezda_assesment/modules/home/data/model/products.dart';
import 'package:tezda_assesment/modules/home/data/repository/product_repository.dart';

final productRepositoryProvider = Provider<ProductRepository>((ref) {
  return ProductRepository();
});

final productsProvider = FutureProvider<Products>((ref) async {
  final repository = ref.read(productRepositoryProvider);
  return repository.fetchProducts();
});