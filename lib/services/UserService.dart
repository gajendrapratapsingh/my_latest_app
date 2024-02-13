import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:myapp/models/User.dart';

class UserService extends GetConnect {

  static const String base_url = "https://jsonplaceholder.typicode.com/";
  String usersEndpoint = "${base_url}users";

  Future<List<User>> getUsers() async {
    try {
      final response = await http.get(Uri.parse(usersEndpoint));
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((json) => User.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load users');
      }
    } catch (e) {
      throw Exception('Failed to load users: $e');
    }
  }
}
