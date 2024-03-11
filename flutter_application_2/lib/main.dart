import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ferrari',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: 
          Image.network('https://www.pngmart.com/files/15/Ferrari-Logo-PNG-Photos.png', height: AppBar().preferredSize.height),
        ),
        body: Column(
          children: <Widget>[
            Image.network('https://cdn.businessinsider.es/sites/navi.axelspringer.es/public/media/image/2022/02/ferrari-sf90-hibrido-auto-zurich-car-show-2021-2605183.jpg?tf=3840x'),
           Row( 
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  crossAxisAlignment:CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Ferrari SF90', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    Text('Italy, Monza', style: TextStyle(fontSize: 16)),
                  ],
                ),
                Row( 
                  children: <Widget>[ 
                    Icon(Icons.star, color: Colors.yellow,),
                    Text('5'),
                  ],
                ), 
              ],
            ),
            Row( 
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Icon(Icons.call),
                Icon(Icons.directions),
                Icon(Icons.share),
              ],
            ),
            Row( 
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text('Telefono'),
                Text('Dirección'),
                Text('Compartir'),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(10), // Cambia este valor para ajustar el padding
              child: Text('The Ferrari SF90 Stradale is a plug-in hybrid sports car produced by the Italian automaker Ferrari. Unveiled in 2019, it represents Ferraris first production plug-in hybrid and is named SF90 to commemorate the Scuderia Ferraris 90th anniversary. The SF90 Stradale is a mid-engine, all-wheel-drive supercar that combines a powerful V8 engine with three electric motors for a total power output of around 1,000 horsepower. It showcases advanced aerodynamics, cutting-edge technology, and high-performance capabilities, making it one of Ferraris flagship models.'),
            ),
          ],
        ),
      ),
    );
  }
}