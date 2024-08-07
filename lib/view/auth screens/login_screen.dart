import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:tms/assets/images.dart';
import 'package:tms/assets/spacing.dart';
import 'package:tms/components/build_button.dart';
import 'package:tms/components/text.dart';
import 'package:tms/components/textfield.dart';
import 'package:tms/view%20model/auth_view_model.dart';
import 'package:tms/view/auth%20screens/register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    var authViewModel = Provider.of<AuthViewModel>(context, listen: false);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image_welcome,
              height: size.height * .3,
              width: size.width * .8,
            ).paddingSymmetric(vertical: size20),
            text("Welcome Back!", fontSize: size40, fontWeight: FontWeight.bold)
                .paddingBottom(size15),
            text("Sign in to your account to continue",
                    textColor: grey,
                    align: TextAlign.center,
                    isCentered: true,
                    fontSize: size16,
                    fontWeight: FontWeight.w300)
                .paddingBottom(size30),
            Align(
                alignment: Alignment.centerLeft,
                child: text("Email",
                    textColor: grey,
                    fontSize: size12,
                    fontWeight: FontWeight.w300)),
            textField(
              controller: emailController,
              height: size55,
              hint: "Email",
              maxline: 1,
            ),
            Align(
                alignment: Alignment.centerLeft,
                child: text("Password",
                    textColor: grey,
                    fontSize: size12,
                    fontWeight: FontWeight.w300)),
            textField(
              controller: passwordController,
              height: size55,
              hint: "Password",
              maxline: 1,
            ),
            Center(
              child: BuildButton(
                  loading: authViewModel.loading,
                  onPressed: () {
                    Map<String, dynamic> data = {
                      "email": emailController.text.trim().toString(),
                      "password": passwordController.text.trim().toString(),
                    };
                    authViewModel.loginApi(data, context);
                  },
                  height: size40,
                  width: size.width * .5,
                  text: "Login"),
            ).paddingBottom(size20),
            Center(child: text("Sign in using", textColor: grey))
                .paddingBottom(size15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < imageModel.length; i++)
                  Container(
                    height: size30,
                    width: 30,
                    decoration: BoxDecoration(
                        color: white,
                        borderRadius: BorderRadius.circular(size10)),
                    child: Image.asset(
                      imageModel[i].image.toString(),
                      height: size30,
                      width: size30,
                    ),
                  ).paddingSymmetric(horizontal: size8)
              ],
            ).paddingBottom(size20),
          ],
        ).paddingAll(size20),
      ),
    );
  }
}
