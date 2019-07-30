import 'package:firstapp/routers/router_handler.dart';
import 'package:fluro/fluro.dart';

const String root = '/';
const String home = '/home';

void configureRoutes(Router router) {
  router.define(home, handler: homeHandler);
}
