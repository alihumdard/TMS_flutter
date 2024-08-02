import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:tms/assets/images.dart';
import 'package:tms/assets/spacing.dart';
import 'package:tms/components/build_button.dart';
import 'package:tms/components/text.dart';
import 'package:tms/components/textfield.dart';
import 'package:tms/view/auth%20screens/register_screen.dart';
import 'package:tms/view/dashboard%20screens/dashboard_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);

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
              height: size55,
              hint: "Password",
              maxline: 1,
            ),
            Center(
              child: BuildButton(
                  onPressed: () {
                    const DashBoardScreen().launch(context);
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
