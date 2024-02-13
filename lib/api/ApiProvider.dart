import 'package:get/get.dart';
import 'package:myapp/models/User.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:myapp/utils/AppUtils.dart';

class ApiProvider extends GetConnect{

  String usersEndpoint = "${AppUtils.baseurl}users";

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

}