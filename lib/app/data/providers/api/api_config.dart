import 'package:connu_app/app/data/services/auth/auth_service.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart' as Get;

abstract class HttpMethods {
  static const String get = 'GET';
  static const String post = 'POST';
  static const String put = 'PUT';
  static const String patch = 'PATCH';
  static const String delete = 'DELETE';
}

class HttpManager {
  static const String baseUrl = 'https://connu.app/api';

  Future httpRequest({
    required String url,
    required String method,
    Map? headers,
    Map? body,
  }) async {
    final Dio dio = Dio();
    final AuthService authService = Get.Get.find<AuthService>();

    final deafaultHeaders =
        headers?.cast<String, String>() ?? <String, String>{}
          ..addAll({
            'Content-Type': Headers.formUrlEncodedContentType,
            'Accept': 'application/jsom',
            'Authorization': 'Bearer ${authService.user.value.token}'
          });

    try {
      Response response = await dio.request(
        '$baseUrl$url',
        options: Options(
          method: method,
          headers: deafaultHeaders,
        ),
        data: body,
      );
      // print(response);
      return response.data;
    } on DioError catch (e) {
      if (e.response != null) {
        print(e.response?.data);
        print(e.response?.headers);
        print(e.response?.requestOptions);
        return e.response?.data;
      } else {
        print(e.requestOptions);
        print(e.message);
      }
    }
  }
}
