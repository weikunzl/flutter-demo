class Api{
  static const String BASE_URL = 'http://127.0.0.1:3000/api/';
  // adb reverse tcp:3000 tcp:3000

  static const String DO_LOGIN = BASE_URL+'login';//登陆

  static const String CHECK_LOGIN = BASE_URL+'check-login';//验证登陆

  static const String LOGOUT = BASE_URL+'logout';//退出登陆

  static const String VERSION = BASE_URL+'version.json';//检查版本
}