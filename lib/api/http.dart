import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

final Map<String, dynamic> optHeader = <String, dynamic>{
  'accept-language': 'zh-cn',
  'content-type': 'application/json'
};

Dio dio = Dio(BaseOptions(connectTimeout: 30000, headers: optHeader));

class Http {

  static Future<T> get<T>(String url, [Map<String, dynamic> params]) async {
    Response<T> response;

// 设置代理 便于本地 charles 抓包
// (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
//     (HttpClient client) {
//   client.findProxy = (uri) {
//     return "PROXY 30.10.26.193:8888";
//   };
// };

    final Directory documentsDir = await getApplicationDocumentsDirectory();
    final String documentsPath = documentsDir.path;
    final Directory dir = Directory('$documentsPath/cookies');
    await dir.create();
    dio.interceptors.add(CookieManager(PersistCookieJar(dir: dir.path)));
    if (params != null) {
      response = await dio.get<T>(url, queryParameters: params);
    } else {
      response = await dio.get<T>(url);
    }
    return response.data;
  }

  static Future<T> post<T>(String url, Map<String, dynamic> params) async {
    final Response<T> response = await dio.post<T>(url, data: params);
    return response.data;
  }
}
