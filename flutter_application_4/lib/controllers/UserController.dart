import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_application_4/models/User.dart';

class UserController {
  Future<List<User>> getUsers() async {
    String url = "https://jsonplaceholder.typicode.com/users";
    Uri uri = Uri.parse(url);
    http.Response response = await http.get(uri);
    List<dynamic> listFromApi = jsonDecode(response.body);
    List<User> users = [];
    for (var jsonUser in listFromApi) {
      User user = User.fromJson(jsonUser);
      users.add(user);
    }
    return users;
  }
}