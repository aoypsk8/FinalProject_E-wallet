import 'package:dio/dio.dart';
import 'package:final_flutter_ewallet/utils/helper/dialog_helper.dart';

class DioClient {
  static Dio dio = Dio(BaseOptions(
    connectTimeout: const Duration(milliseconds: 30000),
    receiveTimeout: const Duration(milliseconds: 30000),
  ));

  //GET
  static Future<dynamic> get(String url, {bool loading = true}) async {
    try {
      if (loading) Loading.show();

      var response = await dio.get(url);
      if (loading) Loading.hide();
      if (response.statusCode == 200) {
        return response.data;
      } else {
        DialogHelper.showErrorDialog(description: response.statusMessage!);
      }
    } catch (e) {
      Loading.hide();
      print(e);
    }
  }

  //POST
  static Future<dynamic> post(String url, dynamic body,
      {bool loading = true}) async {
    try {
      if (loading) Loading.show();
      var response = await dio.post(url, data: body);

      await Future.delayed(Duration(seconds: 2));

      if (loading) Loading.hide();
      if (response.statusCode == 200) {
        return response.data;
      } else if (response.statusCode == 299) {
        // DialogHelper.showErrorDialog(description: response.data);
      } else {
        // DialogHelper.showErrorDialog(description: response.statusMessage!);
      }
    } catch (e) {
      Loading.hide();
      print(e);
      // HandleApiError.dioError(e);
    }
  }
}
