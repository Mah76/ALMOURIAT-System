import 'package:final_project/appfiles/data/API/const.dart';
import 'package:get/get.dart';
import 'package:get/get_connect.dart';

class ApiClient extends GetConnect implements GetxService {
  late String token;
  final String appBaseUrl;
//  late Map<String, String> _mainHeaders;
  ApiClient({
    required this.appBaseUrl,
  }) {
    baseUrl = appBaseUrl;
    timeout = const Duration(seconds: 30);
    token = AppConsts.TOKEN;
  }
  /*_mainHeaders = {
      'Content-type': 'application/json; charset=UTF-8',
      'Authorization': 'Bearer $token',
    }; */
  Future<Response> getData(
    String uri,
  ) async {
    try {
      Response response = await get(uri);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> postData(
    String uri,
    dynamic body,
  ) async {
    print(body.toString());
    try {
      // Response response = await post(uri, body, headers: _mainHeaders);
      Response response = await post(uri, body);
      print(response.toString());
      return response;
    } catch (e) {
      print(e.toString());
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}
