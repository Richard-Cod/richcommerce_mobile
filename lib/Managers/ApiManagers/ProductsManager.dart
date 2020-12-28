import 'dart:convert';

import 'package:richcommerce/Models/Product.dart';
import 'package:http/http.dart' as http;
import 'package:richcommerce/contants/constants.dart';

class ProductsManager {

  String url = "$kApiUrl/products/";
  String start = "/products/";
  String name = "products";


  Future<Product> getAll() async {
    final response = await http.get('$url');

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Product.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load $name');
    }
  }



}