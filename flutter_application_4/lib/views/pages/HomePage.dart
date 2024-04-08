import 'package:flutter/material.dart';
import 'package:flutter_application_4/controllers/UserController.dart';
import 'package:flutter_application_4/models/User.dart';

class HomePage extends StatelessWidget {
  final UserController _userController = UserController();

  @override
  Widget build(BuildContext context) {
    _userController.getUsers();
    return Scaffold(
      appBar: AppBar(
        title: Text('Usuarios'),
      ),
      body: FutureBuilder(
        future: _userController.getUsers(),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              if (snapshot.hasData) {
                List<User>? users = snapshot.data ?? [];
                return createList(users);
              } else {
                return const Text("Error al obtener los usuarios");
              }
            case ConnectionState.waiting:
              return CircularProgressIndicator();
            default:
              return const Text("Error en la conexión");
          }
        },
      ),
    );
  }

  ListView createList(List<User>? users) {
    return ListView.builder(
      itemCount: users?.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(users![index].name),
          subtitle: Text(users[index].email),
        );
      },
    );
  }
}
