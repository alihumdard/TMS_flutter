import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:tms/assets/colors.dart';
import 'package:tms/assets/spacing.dart';
import 'package:tms/components/build_button.dart';
import 'package:tms/components/textfield.dart';

class ProjectDetailsScreen extends StatefulWidget {
  String? topic;
  ProjectDetailsScreen({this.topic, super.key});

  @override
  State<ProjectDetailsScreen> createState() => _ProjectDetailsScreenState();
}

class _ProjectDetailsScreenState extends State<ProjectDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.topic.toString()),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            detailsText(
              txt: "Overview",
            ),
            detailsSubTxt(
              subtext:
                  "We design and develop innovative digital solutions that drive business growth. Our team of experts crafts tailored experiences that captivate audiences.",
            ).paddingSymmetric(vertical: size10),
            detailsText(
              txt: "Work Flow",
            ),
            detailsSubTxt(
              subtext:
                  "Our collaborative process involves discovery, design, development, testing, and launch, ensuring seamless execution and exceptional results.",
            ).paddingSymmetric(vertical: size10),
            detailsText(
              txt: "DeadLine",
            ),
            detailsSubTxt(
              subtext:
                  "Project timeline: 12 weeks, with milestones and check-ins to ensure timely delivery and client satisfaction.",
            ).paddingSymmetric(vertical: size10),
            detailsText(
              txt: "Reference Project",
            ),
            detailsSubTxt(
              subtext:
                  "View our recent success story with XYZ Corporation, where we increased website engagement by 300% through a user-centered design approach.",
            ).paddingSymmetric(vertical: size10),
            const Text(
              "Write Comments",
              style: TextStyle(fontSize: size16, fontWeight: FontWeight.w500),
            ).paddingSymmetric(vertical: size15),
            textField(
              hint: "Write here...",
              minline: 4,
              height: size100,
              maxline: 6,
            ),
            Align(
              alignment: Alignment.center,
              child: BuildButton(
                  onPressed: () {},
                  width: MediaQuery.sizeOf(context).width * .4,
                  text: "Submit"),
            )
          ],
        ).paddingAll(size20),
      ),
    );
  }
}

//details sub text
class detailsSubTxt extends StatelessWidget {
  String? subtext;
  detailsSubTxt({
    this.subtext,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      subtext.toString(),
      style: const TextStyle(fontSize: size14),
    );
  }
}
//details text

class detailsText extends StatelessWidget {
  String? txt;

  detailsText({
    this.txt,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          colors: [primary_color, purple],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Text(
        txt.toString(),
        style: const TextStyle(
          fontSize: size20, color: white,
          // decoration: TextDecoration.underline,
          fontWeight: FontWeight.bold,
        ),
      ).paddingOnly(left: size15, right: size30),
    );
  }
}
