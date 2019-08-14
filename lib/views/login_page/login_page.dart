import 'package:firstapp/services/login.dart';
import 'package:firstapp/views/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          width: size.width,
          color: Theme.of(context).primaryColor,
          child: Center(
            child: Container(
              width: size.width * 0.85,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                color: Colors.white,
                image: DecorationImage(
                  image: const AssetImage(
                    'assets/images/paimaiLogo.png',
                  ),
                  fit: BoxFit.scaleDown,
                  alignment: Alignment.bottomRight,
                ),
              ),
              child: Stack(
                children: <Widget>[
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      const SizedBox(height: 35.0),
                      Image.asset(
                        'assets/images/FlutterGo.png',
                        fit: BoxFit.contain,
                        width: 100.0,
                        height: 100.0,
                      ),
                      buildSignInTextForm(),
                      buildSignInButton(),
                      const SizedBox(height: 35.0),
                    ],
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    bottom: 0,
                    child: buildLoading(),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildLoading() {
    if (isLoading) {
      return Opacity(
        opacity: .5,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.85,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(8.0)),
            color: Colors.black,
          ),
          child: SpinKitCubeGrid(color: Colors.white),
        ),
      );
    }
    return Container();
  }

  Widget buildSignInTextForm() {
    return Container();
  }

  Widget buildSignInButton() {
    return GestureDetector(
      child: Container(
        padding:
            const EdgeInsets.only(left: 42, right: 42, top: 10, bottom: 10),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(5)),
            color: Theme.of(context).primaryColor),
        child: Text(
          'Login',
          style: TextStyle(fontSize: 25, color: Colors.white),
        ),
      ),
      onTap: () {
        doLogin();
      },
    );
  }

  void doLogin() {
    LoginService.login({'username': '11', 'password': '11'}).then((result) {
      print(result);
      setState(() {
        isLoading = false;
      });
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute<Widget>(builder: (BuildContext context) => AppPage()),
          (Route<dynamic> route) => route == null);
    }).catchError((Function onError) {
      print(onError);
      setState(() {
        isLoading = false;
      });
    });
  }
}
