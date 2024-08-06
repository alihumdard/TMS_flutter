import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:tms/assets/colors.dart';
import 'package:tms/assets/images.dart';
import 'package:tms/assets/spacing.dart';
import 'package:tms/components/build_button.dart';
import 'package:tms/components/text.dart';
import 'package:tms/view/auth%20screens/login_screen.dart';
import 'package:tms/view/auth%20screens/register_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    var orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      backgroundColor: primary_color,
      body: SlidingUpPanel(
        panelSnapping: false,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(size40),
            topRight: Radius.circular(size40)),
        minHeight: size.height * .6,
        panel: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              text("Welcome", fontSize: size40, fontWeight: FontWeight.bold),
              const WelcomeRichtext().paddingBottom(size15),
              text("Welcome to TMS, where you manage your daily tasks.",
                      textColor: grey,
                      fontSize: size20,
                      fontWeight: FontWeight.w300)
                  .paddingBottom(size30),
              Center(
                child: BuildButton(
                    onPressed: () {
                      const LoginScreen().launch(context);
                    },
                    height: size40,
                    width: size.width * .5,
                    text: "Login"),
              ).paddingBottom(size20),
              Center(
                child: BuildButton(
                    onPressed: () {
                      const RegisterScreen().launch(context);
                    },
                    height: size40,
                    backgrounDColor: black.withOpacity(.3),
                    width: size.width * .5,
                    borderColor: primary_color,
                    textcolor: white,
                    text: "Sign Up"),
              ).paddingBottom(size30),
              Center(child: text("Sign Up with", textColor: grey))
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
            ]).paddingAll(size20),
        body: SafeArea(
          child: Align(
            alignment: Alignment.topCenter,
            child: Image.asset(
              image_hello,
              height: size.height * .3,
              width: orientation == Orientation.landscape
                  ? size.width * .9
                  : size.width * .8,
            ),
          ),
        ),
      ),
    );
  }
}
