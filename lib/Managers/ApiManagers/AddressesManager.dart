import 'dart:convert';

import 'package:richcommerce/Managers/ApiManagers/Util.dart';
import 'package:richcommerce/Models/Address.dart';
import 'package:http/http.dart' as http;
import 'package:richcommerce/contants/constants.dart';

class AddressesManager {
  String url = "$kApiEndpoint/adresses";
  String attr = "hydra:member";

  Future<List<Address>> findAll() async {
    final response = await Util.makeAuthenticatedGetRequest(url);
    print(response.statusCode);

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      var jsonResponse = json.decode(response.body);
      var jsonAddresss = jsonResponse[attr];

      print("success");

      List<Address> result = [];
      for (var jsonAddress in jsonAddresss) {
        result.add(Address.fromJson(jsonAddress));
      }
      return result;

    } else {
      print("Error");
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load addresses');
    }
  }

  Future<Address> findOneById(int id) async {
    final response = await Util.makeAuthenticatedGetRequest('$url/$id');
    print(response.statusCode);

    print(response.body);
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      var jsonResponse = json.decode(response.body);

      print("success");
      return Address.fromJson(jsonResponse);

    }else if(response.statusCode == 404) {
      return null;
    } else {
      print("Error");
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load address');
    }
  }



}