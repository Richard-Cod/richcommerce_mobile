import 'dart:convert';

import 'package:richcommerce/Managers/ApiManagers/Util.dart';
import 'package:richcommerce/Models/Category.dart';
import 'package:http/http.dart' as http;
import 'package:richcommerce/contants/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CategoriesManager {
  String url = "$kApiEndpoint/categories";
  String attr = "hydra:member";



  Future<List<Category>> findAll() async {
    final response = await Util.makeAuthenticatedGetRequest(url);
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
    final response = await Util.makeAuthenticatedGetRequest('$url/$id');
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      var jsonResponse = json.decode(response.body);

      print("success");
      return Category.fromJson(jsonResponse);
    } else if (response.statusCode == 404) {
      return null;
    } else {
      print("Error");
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load category');
    }
  }
}
