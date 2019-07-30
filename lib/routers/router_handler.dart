import 'package:firstapp/views/home.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';

Handler homeHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) =>
        AppPage());
