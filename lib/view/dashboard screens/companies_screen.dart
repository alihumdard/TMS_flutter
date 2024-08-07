import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:tms/assets/colors.dart';
import 'package:tms/assets/spacing.dart';
import 'package:tms/components/text.dart';

class CompanyScreen extends StatefulWidget {
  const CompanyScreen({super.key});

  @override
  State<CompanyScreen> createState() => _CompanyScreenState();
}

class _CompanyScreenState extends State<CompanyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Companies"),
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
            itemCount: 6,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(size15),
                  gradient: LinearGradient(
                    colors: [primary_color, primary_color.withOpacity(.3)],
                    begin: Alignment.topLeft,
                    end: Alignment.topRight,
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            text("Tech Solution Pro",
                                fontSize: size18,
                                textColor: white,
                                fontWeight: FontWeight.w600),
                            text("waheed.wazir@gmail.com",
                                fontSize: size15,
                                textColor: white,
                                fontWeight: FontWeight.w400),
                            text("Expiry: 12/08/2024",
                                fontSize: size15,
                                textColor: white,
                                fontWeight: FontWeight.w400),
                            Row(
                              children: [
                                const Icon(
                                  Icons.phone_outlined,
                                  color: white,
                                ),
                                const SizedBox(
                                  width: size10,
                                ),
                                text("+92 3335454545",
                                    fontSize: size15,
                                    textColor: white,
                                    fontWeight: FontWeight.w400),
                              ],
                            ),
                          ],
                        ),
                        const Spacer(),
                        Column(
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                      width: size50,
                                      decoration: BoxDecoration(
                                          color: white,
                                          borderRadius:
                                              BorderRadius.circular(size15)),
                                      child: Center(
                                          child: const Icon(
                                        Icons
                                            .drive_file_rename_outline_outlined,
                                        color: primary_color,
                                        size: size30,
                                      ).paddingAll(size10)))
                                  .paddingAll(10.0),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                      width: size50,
                                      decoration: BoxDecoration(
                                          color: white,
                                          borderRadius:
                                              BorderRadius.circular(size15)),
                                      child: Center(
                                          child: const Icon(
                                        Icons.delete_outline_rounded,
                                        color: redColor,
                                        size: size30,
                                      ).paddingAll(size10)))
                                  .paddingAll(10.0),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ).paddingAll(size15),
              ).paddingBottom(size15);
            },
          ))
        ],
      ).paddingAll(size20),
    );
  }
}
