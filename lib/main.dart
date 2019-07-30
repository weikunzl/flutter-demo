import 'package:firstapp/routers/application.dart' as application;
import 'package:firstapp/routers/routers.dart';
import 'package:firstapp/views/home.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  MyApp() {
    final Router router = Router();
    configureRoutes(router);

    application.router = router;
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Color themeColor = const Color(0xFFC91B3A);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'first app',
      theme: ThemeData(
        primaryColor: themeColor,
        backgroundColor: const Color(0xFFEFEFEF),
        textTheme: TextTheme(
          body1: TextStyle(color: const Color(0xFF888888), fontSize: 16),
        ),
        iconTheme: IconThemeData(color: themeColor, size: 35),
      ),
      home: Scaffold(body: showWelcomePage()),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: application.router.generator,
    );
  }

  Widget showWelcomePage() {
    return AppPage();
  }
}
