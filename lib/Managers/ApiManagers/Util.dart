import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;


class Util {

  static makeAuthenticatedGetRequest(String url) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    String token = _prefs.getString('authToken');

    final response = await http.get(
      '$url',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token'
      },
    );

    return response;
  }

}
