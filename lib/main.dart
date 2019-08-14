import 'package:firstapp/routers/application.dart' as application;
import 'package:firstapp/routers/routers.dart';
import 'package:firstapp/services/login.dart';
import 'package:firstapp/views/home.dart';
import 'package:firstapp/views/login_page/login_page.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

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

const Color themeColor = Color(0xFFC91B3A);

class _MyAppState extends State<MyApp> {
  bool _hasLogin = false;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _isLoading = true;
    LoginService.checkLogin().then((bool hasLogin) {
      setState(() {
        _hasLogin = hasLogin;
        _isLoading = false;
      });
    }).catchError(([Object errorMessage]) {
      setState(() {
        _hasLogin = false;
        _isLoading = false;
      });
      print('身份信息验证失败:$errorMessage');
    });
  }

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
        iconTheme: const IconThemeData(color: themeColor, size: 35),
      ),
      home: Scaffold(body: showWelcomePage()),
      debugShowCheckedModeBanner: false,
      onGenerateRoute: application.router.generator,
    );
  }

  Widget showWelcomePage() {
    if (_isLoading) {
      return Container(
        color: themeColor,
        child: Center(
          child: SpinKitCubeGrid(color: Colors.white),
        ),
      );
    }
    if (_hasLogin) {
      return AppPage();
    } else {
      return LoginPage();
    }
  }
}

