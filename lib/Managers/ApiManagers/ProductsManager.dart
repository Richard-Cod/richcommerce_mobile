import 'dart:convert';

import 'package:richcommerce/Models/Product.dart';
import 'package:http/http.dart' as http;
import 'package:richcommerce/contants/constants.dart';

class ProductsManager {
  String url = "$kApiUrl/products";
  String attr = "hydra:member";

  Future<List<Product>> findAll() async {
    final response = await http.get('$url');
    print(response.statusCode);

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      var jsonResponse = json.decode(response.body);
      var jsonProducts = jsonResponse[attr];

      print("success");

      List<Product> result = [];
      for (var jsonProduct in jsonProducts) {
        result.add(Product.fromJson(jsonProduct));
      }
      return result;

    } else {
      print("Error");
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load products');
    }
  }

  Future<Product> findOneById(int id) async {
    final response = await http.get('$url/$id');
    print(response.statusCode);

    print(response.body);
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      var jsonResponse = json.decode(response.body);

      print("success");
      return Product.fromJson(jsonResponse);

    } else {
      print("Error");
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load product');
    }
  }



}