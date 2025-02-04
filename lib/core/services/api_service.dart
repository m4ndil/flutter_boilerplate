import 'dart:convert';
import 'package:http/http.dart' as http;
import '../utils/constants.dart';

class ApiService {
  Future<Map<String, dynamic>?> login(String username, String password) async {
    final url = Uri.parse('${Constants.baseUrl}/api/X');
    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: json.encode({"username": username, "password": password}),
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to login');
    }
  }

  Future<Map<String, dynamic>?> getItemList(String token) async {
    final url = Uri.parse('${Constants.baseUrl}/X);
    final response = await http.get(
      url,
      headers: {
        "Authorization": "Bearer $token",
        "Content-Type": "application/json"
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load item list');
    }
  }
}
