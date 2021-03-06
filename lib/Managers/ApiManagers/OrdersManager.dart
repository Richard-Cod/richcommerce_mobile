import 'dart:convert';

import 'package:richcommerce/Managers/ApiManagers/Util.dart';
import 'package:richcommerce/Models/Order.dart';
import 'package:http/http.dart' as http;
import 'package:richcommerce/contants/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OrdersManager {

  String url = "$kApiEndpoint/orders";
  String attr = "hydra:member";



  Future<List<Order>> findAll() async {
    final response = await Util.makeAuthenticatedGetRequest(url);
    print(response.statusCode);

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      var jsonResponse = json.decode(response.body);
      var jsonOrders = jsonResponse[attr];

      print("success");

      List<Order> result = [];
      for (var jsonOrder in jsonOrders) {
        result.add(Order.fromJson(jsonOrder));
      }
      return result;

    } else {
      print("Error");
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load orders');
    }
  }

  Future<Order> findOneById(int id) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String token = _prefs.getString('authToken');

    final response = await http.get(
      '$url/$id',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token'
      },
    );

    print(response.statusCode);

    print(response.body);
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      var jsonResponse = json.decode(response.body);

      print("success");
      return Order.fromJson(jsonResponse);

    }else if(response.statusCode == 404) {
      return null;
    } else {
      print("Error");
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load order');
    }
  }



}