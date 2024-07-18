import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:tezda_assesment/core/services/logging_service.dart';
import 'package:tezda_assesment/modules/home/data/model/products.dart';

class ProductRepository {
  Future<Products> fetchProducts() async {
    final response =
        await http.get(Uri.parse('https://dummyjson.com/products'));

    if (response.statusCode == 200) {
      Print().logInfo(response.body);
      return Products.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load products');
    }
  }
}
