import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:tms/assets/images.dart';
import 'package:tms/assets/spacing.dart';
import 'package:tms/components/text.dart';

// import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String? _imageUrl;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
        appBar: AppBar(centerTitle: true, title: const Text("Profile")),
        body: WillPopScope(
            onWillPop: () async {
              return true;
            },
            child: SingleChildScrollView(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Row(),
                Container(
                  padding: const EdgeInsets.only(top: size20),
                  height: MediaQuery.sizeOf(context).height * .6,
                  decoration: BoxDecoration(boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(2, 2),
                      blurRadius: 4,
                      spreadRadius: 1,
                    ),
                  ], borderRadius: BorderRadius.circular(size15), color: white),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.center,
                          child: InkWell(
                            onTap: () {},
                            child: Container(
                              width: size100,
                              height: size100,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: ClipOval(
                                child: Image.asset(
                                  image_profile,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: size40,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            text("Waheed Ullah",
                                    fontWeight: FontWeight.w600,
                                    fontSize: size16)
                                .paddingSymmetric(vertical: size20),
                            text("Developer",
                                    fontWeight: FontWeight.w500,
                                    fontSize: size16)
                                .paddingSymmetric(vertical: size20),
                          ],
                        ),
                        text("abc@gmail.com",
                                fontWeight: FontWeight.w500, fontSize: size16)
                            .paddingSymmetric(vertical: size20),
                      ],
                    ).paddingAll(size10),
                  ),
                ),
              ],
            ).paddingAll(size20))));
  }
}
