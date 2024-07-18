import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:tezda_assesment/modules/home/model/products.dart';

class ProductRepository {
  Future<Products> fetchProducts() async {
    final response =
        await http.get(Uri.parse('https://dummyjson.com/products'));

    if (response.statusCode == 200) {
      log(response.body);
      return Products.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load products');
    }
  }
}