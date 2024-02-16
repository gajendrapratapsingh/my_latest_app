import 'package:get/get.dart';
import 'package:myapp/models/User.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:myapp/utils/AppUtils.dart';

class ApiProvider extends GetConnect{

  String usersEndpoint = "${AppUtils.baseurl}users";

  static const String loginUrl = "https://dummyjson.com/auth/login";

  Future<List<User>> getUsers() async {
    try {
      final response = await http.get(Uri.parse(usersEndpoint));
      if(response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((json) => User.fromJson(json)).toList();
      } else {
         throw Exception('Failed to load users');
      }
    } catch (e) {
      throw Exception('Failed to load users: $e');
    }
  }


  // 'username': 'kminchelle',
  // 'password': '0lelplR',
  Future<dynamic> loginUser(String username, String password) async{
    final headers = {'Content-Type': 'application/json'};
    final body = jsonEncode({
      'username': username,
      'password': password,
    });
    try {
      final response = await http.post(Uri.parse(loginUrl), headers: headers, body: body);
      if(response.statusCode == 200) {
        final data = jsonDecode(response.body);
        //print(data);
        return data;
      } else {
        print('Failed to fetch login: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      throw Exception('Failed to login: $e');
    }
  }

}