import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyPasswordGeneratorApp());
}

class PasswordGenerator {
  String generatePassword(int length, bool facilDeLeer, bool todosCarac, bool uppercase, bool lowercase, bool numbers, bool symbols) {
    String caracteres = '';

    if (todosCarac) {
      caracteres = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#\$%^&*()_-+=<>?/[]{},.:;';
    } else {
      if (facilDeLeer) {
        caracteres = 'abcdefghjkmnpqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
      } else {
        if (lowercase) caracteres += 'abcdefghijklmnopqrstuvwxyz';
        if (uppercase) caracteres += 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
        if (numbers) caracteres += '0123456789';
        if (symbols) caracteres += '!@#\$%^&*()_-+=<>?/[]{},.:;';
      }
    }

    String password = '';
    final Random random = Random();

    for (int i = 0; i < length; i++) {
      password += caracteres[random.nextInt(caracteres.length)];
    }

    return password;
  }
}

class MyPasswordGeneratorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Generador de contraseñas',
      home: PasswordGeneratorApp(),
    );
  }
}

class PasswordGeneratorApp extends StatefulWidget {
  @override
  _PasswordGeneratorAppState createState() => _PasswordGeneratorAppState();
}

class _PasswordGeneratorAppState extends State<PasswordGeneratorApp> {
  int passwordLength = 8;
  bool facilDeLeer = false;
  bool todosCarac = false;
  bool uppercase = true;
  bool lowercase = true;
  bool numbers = true;
  bool symbols = true;

  PasswordGenerator passwordGenerator = PasswordGenerator();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Generador de Contraseñas'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              padding: EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Text(
                passwordGenerator.generatePassword(passwordLength, facilDeLeer, todosCarac, uppercase, lowercase, numbers, symbols),
                style: TextStyle(fontSize: 20.0),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Longitud de la Contraseña:'),
                    Container(
                      width: 50.0,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          setState(() {
                            passwordLength = int.tryParse(value) ?? passwordLength;
                          });
                        },
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Radio(
                          value: true,
                          groupValue: facilDeLeer,
                          onChanged: (value) {
                            setState(() {
                              facilDeLeer = value as bool;
                              if (facilDeLeer) {
                                numbers = false;
                                symbols = false;
                                todosCarac = false;
                              }
                            });
                          },
                        ),
                        Text('Fácil de Decir'),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                          value: true,
                          groupValue: todosCarac,
                          onChanged: (value) {
                            setState(() {
                              todosCarac = value as bool;
                              if (todosCarac) {
                                uppercase = true;
                                lowercase = true;
                                numbers = true;
                                symbols = true;
                                facilDeLeer = false;
                              }
                            });
                          },
                        ),
                        Text('Todos los Caracteres'),
                      ],
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Checkbox(
                      value: uppercase,
                      onChanged: (value) {
                        setState(() {
                          uppercase = value!;
                        });
                      },
                    ),
                    Text('Mayúsculas'),
                    Checkbox(
                      value: lowercase,
                      onChanged: (value) {
                        setState(() {
                          lowercase = value!;
                        });
                      },
                    ),
                    Text('Minúsculas'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Checkbox(
                      value: numbers,
                      onChanged: (value) {
                        setState(() {
                          numbers = value!;
                          if (facilDeLeer && numbers) {
                            facilDeLeer = false;
                          }
                        });
                      },
                    ),
                    Text('Números'),
                    Checkbox(
                      value: symbols,
                      onChanged: (value) {
                        setState(() {
                          symbols = value!;
                          if (facilDeLeer && symbols) {
                            facilDeLeer = false;
                          }
                        });
                      },
                    ),
                    Text('Símbolos'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
