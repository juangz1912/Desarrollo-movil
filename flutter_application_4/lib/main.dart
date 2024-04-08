import 'package:flutter/material.dart';
import 'package:flutter_application_4/views/pages/HomePage.dart';
import 'package:flutter_application_4/views/pages/LoginPage.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
   final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      initialRoute: 'login',
      routes: {
        'login':(context) => LoginPage(),
        'home':(context) => HomePage(),
      },
    );
  }
}
