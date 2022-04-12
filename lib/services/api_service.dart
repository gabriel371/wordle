import 'dart:convert';

import 'package:http/http.dart' as http;

class APIService {
  static const String _authority = "random-words5.p.rapidapi.com";
  static const _path = "/getRandom";
  static const _query = {"wordLength": "5"};
  static const Map<String, String> _headers = {
    "x-rapidapi-host": "random-words5.p.rapidapi.com",
    "x-rapidapi-key": "fd73af7d1dmsh7f85fddd3d10ebep19e543jsnab2d5f4a484a",
  };

  Future<String> get() async {
    Uri uri = Uri.https(_authority, _path, _query);
    final response = await http.get(uri, headers: _headers);
    if (response.statusCode == 200) {
      return response.body;
    } else {
      throw Exception(
          "Failed to load json data. Returned: ${response.statusCode}: ${response.reasonPhrase}");
    }
  }
}
