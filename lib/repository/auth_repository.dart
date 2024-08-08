import 'package:tms/data/network/networkApiServices.dart';
import 'package:tms/res/appUrl.dart';

class AuthRepository {
  NetworkApiServices apiServices = NetworkApiServices();

  //login...........
  Future<dynamic> loginApi(Map<String, dynamic> data) async {
    var headers = {'Content-Type': 'application/json'};
    try {
      dynamic response =
          await apiServices.postApi(data, AppUrls.urlLogin, headers);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
