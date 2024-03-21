import 'package:flutter/material.dart';
import 'package:flutter_application_3/controller/ContactProvider.dart';
import 'package:flutter_application_3/view/pages/ListContactPage.dart';
import 'package:flutter_application_3/controller/UserCount.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (_) => UserCounterProvider()),
      ChangeNotifierProvider(create: (_) => ContactProvider()),
    ],
    child: MainApp(),
  ));
}

class MainApp extends StatelessWidget {
  String title = "Contactos";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ListContactPage(),
      ),
    );
  }
}