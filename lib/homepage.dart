import 'package:flutter/material.dart';
import 'package:flutter_proyecto_rehecho/transiciones.dart';

import 'mapasbancos/mapabcp.dart';
import 'mapasbancos/mapabisa.dart';
import 'mapasbancos/mapabnb.dart';
import 'mapasbancos/mapaganadero.dart';
import 'mapasbancos/mapamercantil.dart';
import 'mapasbancos/mapaunion.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Cajeros Cercanos'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Cajeros Cercanos',
                  style: TextStyle(fontSize: 40.0, color: Colors.white),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Una app para buscar los cajeros más',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'cercanos de los bancos más importantes',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'de La Paz',
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Image(
              image: NetworkImage(
                  'https://images.unsplash.com/photo-1526304640581-d334cdbbf45e?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    FlatButton(
                      onPressed: () {
                        setState(() {
                          Navigator.push(context, RotationRoute(page: Union()));
                        });
                      },
                      child: Center(
                        child: Text(
                          'Banco Unión',
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                    ),
                    FlatButton(
                      onPressed: () {
                        setState(() {
                          Navigator.push(context, RotationRoute(page: Bisa()));
                        });
                      },
                      child: Center(
                        child: Text(
                          'Banco Bisa',
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                    ),
                    FlatButton(
                      onPressed: () {
                        setState(() {
                          Navigator.push(context, RotationRoute(page: Bnb()));
                        });
                      },
                      child: Center(
                        child: Text(
                          'Banco BNB',
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    FlatButton(
                      onPressed: () {
                        setState(() {
                          Navigator.push(
                              context, RotationRoute(page: Mercantil()));
                        });
                      },
                      child: Center(
                        child: Text(
                          'Banco Mercantil',
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                    ),
                    FlatButton(
                      onPressed: () {
                        setState(() {
                          Navigator.push(
                              context, RotationRoute(page: Ganadero()));
                        });
                      },
                      child: Center(
                        child: Text(
                          'Banco Ganadero',
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                    ),
                    FlatButton(
                      onPressed: () {
                        setState(() {
                          Navigator.push(context, RotationRoute(page: Bcp()));
                        });
                      },
                      child: Center(
                        child: Text(
                          'Banco BCP',
                          style: TextStyle(fontSize: 20.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        backgroundColor: Colors.teal,
      ),
    );
  }
}
