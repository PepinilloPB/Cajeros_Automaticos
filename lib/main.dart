import 'package:flutter/material.dart';
import 'homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget miwidget = HomePage();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // ignore: missing_return
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (context) => HomePage());
            break;
        }
      },
    );
  }
}
