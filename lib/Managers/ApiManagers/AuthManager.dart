import 'dart:convert';

import 'package:richcommerce/Models/Order.dart';
import 'package:http/http.dart' as http;
import 'package:richcommerce/Models/User.dart';
import 'package:richcommerce/contants/constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthManager {
  String getTokenUrl = "$kApiUrl/authentication_token";
  String attr = "hydra:member";


  Future<String> getAuthToken(User u) async {
    final http.Response response = await http.post(
      '$getTokenUrl',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'email': u.email,
        'password': u.password,
      }),
    );

    print(response.body);
    print(response.statusCode);

    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);

      String token = jsonResponse['token'];
      SharedPreferences _prefs = await SharedPreferences.getInstance();
      _prefs.setString('authToken', token);

      return token;
    } else {
      throw Exception('Failed to post (getToken) .');
    }
  }



}