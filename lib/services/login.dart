import 'package:firstapp/api/constants.dart';
import 'package:firstapp/api/http.dart';
import 'package:firstapp/models/user_info.dart';

class LoginService {
  static Future<bool> checkLogin() async {
    final Map<String, dynamic> response =
        await Http.get<Map<String, dynamic>>(Api.CHECK_LOGIN);
    final bool success = response['success'];
    print('验证登陆：$success');
    return success;
  }


  static Future<UserInfo> login(Map<String, String> params) async {
    final Map<String, dynamic> response = await Http.post<Map<String, dynamic>>(Api.DO_LOGIN, params);
    print('登陆用户：$response');
    final UserInfo userInfo = UserInfo.fromJson(response['data']);
    return userInfo;
  }
}
