import 'package:flutter/material.dart';
import 'package:flutter_application_3/controller/UserCount.dart';
import 'package:provider/provider.dart';


PreferredSizeWidget AppBarContact(String title) {
  return AppBar(
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 18),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        Consumer<UserCounterProvider>(
          builder: (context, userCounterProvider, child) => Text(
            'Usuarios: ${userCounterProvider.userCount}',
            style: const TextStyle(color: Colors.white, fontSize: 16),
          ),
        ),
      ],
    ),
    backgroundColor: Colors.blueAccent,
    toolbarHeight: 80,
  );
}



