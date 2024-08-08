import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:tms/repository/auth_repository.dart';
import 'package:tms/view/dashboard%20screens/dashboard_screen.dart';

class AuthViewModel with ChangeNotifier {
  //circle loading
  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

//save token
  String? _token;

  String? get token => _token;

  Future<void> saveToken(String token) async {
    _token = token;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('LoginToken', token);
    notifyListeners();
  }

//load token
  Future<void> loadToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _token = prefs.getString('LoginToken');
    notifyListeners();
  }

//delete token
  Future<void> deleteToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('LoginToken');
    _token = null;
    notifyListeners();
  }

// Login API..............................................................>>
  Future<void> loginApi(Map<String, dynamic> data, BuildContext context) async {
    setLoading(true);

    final authRepository = AuthRepository();

    authRepository.loginApi(data).then((value) async {
      if (value["status"] == "success") {
        setLoading(false);
        saveToken(value["token"]);

        const DashBoardScreen().launch(context);
        toast(value["message"], bgColor: greenColor, textColor: white);
      } else {
        setLoading(false);

        toast(value["message"], bgColor: redColor, textColor: white);
      }
    }).onError((error, stackTrace) {
      setLoading(false);

      if (kDebugMode) {
        print("Login debug:  ${error.toString()}");
      }
      toast(error.toString(), bgColor: redColor, textColor: white);
    });
  }
}
