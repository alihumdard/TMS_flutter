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
                  // padding: const EdgeInsets.only(top: size20),
                  height: MediaQuery.sizeOf(context).height * .6,
                  decoration: BoxDecoration(boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(2, 2),
                      blurRadius: 4,
                      spreadRadius: 1,
                    ),
                  ], borderRadius: BorderRadius.circular(size15), color: white),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      ColorFiltered(
                        colorFilter: ColorFilter.mode(
                            blackColor.withOpacity(0.6), BlendMode.srcATop),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(size15),
                          child: Image.asset(
                            "images/tsp.png",
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Align(
                              alignment: Alignment.center,
                              child: InkWell(
                                onTap: () {},
                                child: Container(
                                  width: 150.0,
                                  height: 150.0,
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: ClipOval(
                                    child: Image.asset(
                                      image_profile,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                ).paddingTop(size30),
                              ),
                            ),
                            const SizedBox(
                              height: size40,
                            ),
                            text("Waheed Ullah",
                                fontWeight: FontWeight.w600,
                                textColor: white,
                                fontSize: size25),
                            text("Software Engineer",
                                    fontWeight: FontWeight.w500,
                                    textColor: white,
                                    fontSize: size18)
                                .paddingBottom(size20),
                            text("waheed.ullah@gmail.com",
                                    fontWeight: FontWeight.w500,
                                    textColor: white,
                                    fontSize: size18)
                                .paddingSymmetric(vertical: size20),
                          ],
                        ).paddingAll(size10),
                      ),
                    ],
                  ),
                ),
              ],
            ).paddingAll(size20))));
  }
}
