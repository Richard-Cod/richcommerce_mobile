import 'dart:convert';

import 'package:richcommerce/Models/Category.dart';
import 'package:http/http.dart' as http;
import 'package:richcommerce/contants/constants.dart';

class CategoriesManager {
  String url = "$kApiUrl/categories";
  String attr = "hydra:member";

  Future<List<Category>> findAll() async {
    final response = await http.get('$url');
    print(response.statusCode);

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      var jsonResponse = json.decode(response.body);
      var jsonCategorys = jsonResponse[attr];

      print("success");

      List<Category> result = [];
      for (var jsonCategory in jsonCategorys) {
        result.add(Category.fromJson(jsonCategory));
      }
      return result;

    } else {
      print("Error");
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load categories');
    }
  }

  Future<Category> findOneById(int id) async {
    final response = await http.get('$url/$id');
    print(response.statusCode);

    print(response.body);
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      var jsonResponse = json.decode(response.body);

      print("success");
      return Category.fromJson(jsonResponse);

    } else {
      print("Error");
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load category');
    }
  }



}