import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:tms/repository/auth_repository.dart';
import 'package:tms/view/dashboard%20screens/dashboard_screen.dart';

class AuthViewModel with ChangeNotifier {
  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

// Login API..............................................................>>
  Future<void> loginApi(Map<String, dynamic> data, BuildContext context) async {
    setLoading(true);

    final authRepository = AuthRepository();

    authRepository.loginApi(data).then((value) async {
      if (value["status"] == "success") {
        setLoading(false);

        const DashBoardScreen().launch(context);
        toast(value["message"], bgColor: greenColor, textColor: white);
      } else {
        setLoading(false);

        toast(value["message"], bgColor: redColor, textColor: white);
      }
      // final SharedPreferences sp = await SharedPreferences.getInstance();
      //pre login Token For complete Profile or signUp
      // sp.setString("preloginToken", value["token"]["access"]["token"].toString());

      //  if (value["user"]["isProfileCompleted"] == false) {
      // setLoading(false);
      // const SignUpScreen2().launch(context);
      // } else if(value["user"]["role"]=="vendor"){
      // sp.setString("accessToken", value["token"]["access"]["token"].toString());
      // sp.setString("refreshToken", value["token"]["refresh"]["token"].toString());
      // sp.setString("userId", value["user"]["_id"].toString());
      // sp.setString("name", value["user"]["name"].toString());
      // sp.setString("email", value["user"]["email"].toString());
      // sp.setString("DOB",value["user"]["DOB"].toString());
      // sp.setString("contact", value["user"]["contact"].toString());
      // sp.setString("userImageURl", value["user"]["image"].toString());
      // sp.setString("referralCode", value["user"]["referralCode"]);
      // sp.setString("prestigeNumber", value["user"]["prestigeNumber"]);
      // sp.setBool("isProfileCompleted", value["user"]["isProfileCompleted"]);
      // sp.setBool("Membership", value["user"]["Membership"]);
      // setLoading(false);
      // ignore: use_build_context_synchronously
      // updateDeviceToken(value["token"]["access"]["token"].toString(), context);
      // }
      // else {
      // setLoading(false);
      // utils().flushBar(context, "You can only login with a vendor account.");

      //     }
      //   }).onError((error, stackTrace) {
      //     setLoading(false);
      //     if (kDebugMode) {
      //       print("Login debug:  ${error.toString()}");
      //     }
      //     utils().flushBar(context, error.toString());
      //     if (error.toString().contains("Please verify")) {
      //       if (kDebugMode) {
      //         print("Launching OTP verification...");
      //       }
      //       OtpVerification(email: data["email"]).launch(context);
      //     }
    }).onError((error, stackTrace) {
      if (kDebugMode) {
        print("Login debug:  ${error.toString()}");
      }
      toast(error.toString(), bgColor: redColor, textColor: white);
    });
  }
}
