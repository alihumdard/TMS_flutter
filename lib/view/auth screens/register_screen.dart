import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:tms/assets/colors.dart';
import 'package:tms/assets/images.dart';
import 'package:tms/assets/spacing.dart';
import 'package:tms/components/build_button.dart';
import 'package:tms/components/text.dart';
import 'package:tms/components/textfield.dart';
import 'package:tms/view/auth%20screens/login_screen.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  File? _image;

  Future<void> _pickImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        _image = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    var orientation = MediaQuery.of(context).orientation;
    return Scaffold(
      body: SlidingUpPanel(
        color: primary_color,
        panelSnapping: true,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(size40),
            topRight: Radius.circular(size40)),
        minHeight: size.height * .7,
        maxHeight: size.height * 1,
        panel: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                text("Register Your \nCompany!",
                    fontSize: size40,
                    textColor: white,
                    fontWeight: FontWeight.bold),
                text("Enter company information",
                        textColor: white,
                        fontSize: size20,
                        fontWeight: FontWeight.w300)
                    .paddingBottom(size30),
                textField(
                  maxline: 1,
                  height: size50,
                  hint: "type full company name",
                ),
                textField(
                  maxline: 1,
                  height: size50,
                  hint: "Email",
                ),
                Row(
                  children: [
                    Expanded(
                      child: textField(
                        maxline: 1,
                        height: size50,
                        hint: "Phone Number",
                      ),
                    ),
                    const SizedBox(
                      width: size15,
                    ),
                    Expanded(
                      child: textField(
                        maxline: 1,
                        height: size50,
                        hint: "WhatsApp",
                      ),
                    ),
                  ],
                ),
                textField(
                  maxline: 1,
                  height: size50,
                  hint: "Upload company logo",
                  suffix: ElevatedButton(
                          onPressed: () {
                            _pickImage();
                          },
                          child: _image == null
                              ? const Icon(Icons.upload)
                              : text("Picked"))
                      .paddingAll(size8),
                ),
                textField(
                  maxline: 1,
                  height: size50,
                  hint: "Joining date",
                ),
                textField(
                  maxline: 1,
                  height: size50,
                  hint: "Contract Expiry date",
                ),
                Center(
                  child: BuildButton(
                      onPressed: () {
                        const LoginScreen().launch(context);
                      },
                      height: size40,
                      backgrounDColor: white,
                      width: size.width * .5,
                      borderColor: primary_color,
                      textcolor: primary_color,
                      text: "Register"),
                ),
              ]).paddingAll(size20),
        ),
        body: SafeArea(
          child: Align(
            alignment: Alignment.topCenter,
            child: Image.asset(
              image_register,
              height: size.height * .25,
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

class ImageModel {
  String? image;
  ImageModel({this.image});
}

final imageModel = [
  ImageModel(image: image_facebook),
  ImageModel(image: image_google),
  ImageModel(image: image_github)
];
