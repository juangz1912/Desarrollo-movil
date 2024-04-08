import 'package:flutter/material.dart';
import 'package:flutter_application_4/controllers/UserController.dart';
import 'package:flutter_application_4/models/User.dart';

class LoginController {
  final UserController _userController = UserController();

  Future<void> login(String email, String password, BuildContext context) async {
    List<User> users = await _userController.getUsers();
    bool isAuthenticated = false;
    for (User user in users) {
      if (user.name == email && user.email == password) {
        isAuthenticated = true;
        break;
      }
    }
    if (isAuthenticated) {
      Navigator.pushNamed(context, 'home');
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Credenciales incorrectas'),
        ),
      );
    }
  }

  void signup(GlobalKey<FormState> key, BuildContext context,
      {required String email, required String password}) {
    if (!key.currentState!.validate()) {
      return;
    }
    print("$email $password");
    Navigator.pushNamed(context, "home");
  }

  String? validTextFormField(value) {
    if (value == null || value.isEmpty) {
      return "El campo es obligatorio.";
    }
    return null;
  }
}
