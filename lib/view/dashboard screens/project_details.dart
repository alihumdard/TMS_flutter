import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:tms/assets/colors.dart';
import 'package:tms/assets/spacing.dart';
import 'package:tms/components/build_button.dart';
import 'package:tms/components/text.dart';
import 'package:tms/components/textfield.dart';
import 'package:tms/view%20model/home_view_model.dart';

class ProjectDetailsScreen extends StatefulWidget {
  var id;
  ProjectDetailsScreen({this.id, super.key});

  @override
  State<ProjectDetailsScreen> createState() => _ProjectDetailsScreenState();
}

class _ProjectDetailsScreenState extends State<ProjectDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.id!["name"].toString()),
      ),
      body: FutureBuilder(
          future: HomeViewModel()
              .getSingalOrderDetails(context, widget.id["id"].toString()),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                  child: CircularProgressIndicator(
                color: primary_color,
              ));
            } else if (snapshot.hasError) {
              return Center(
                  child: text(snapshot.error.toString(), maxLine: 10));
            } else if (!snapshot.hasData) {
              return Center(child: text("No Projects found", maxLine: 10));
            } else {
              var dataa = snapshot.data["data"]["project"];
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    detailsText(
                      txt: "Overview",
                    ),
                    detailsSubTxt(
                      subtext: dataa["description"] ?? "Not Available",
                    ).paddingSymmetric(vertical: size10),
                    detailsText(
                      txt: "Work Flow",
                    ),
                    detailsSubTxt(
                      subtext: dataa["plan"] ?? "Not Available",
                    ).paddingSymmetric(vertical: size10),
                    detailsText(
                      txt: "DeadLine",
                    ),
                    detailsSubTxt(
                      subtext: dataa["deadline"] ?? "Not Available",
                    ).paddingSymmetric(vertical: size10),
                    detailsText(
                      txt: "Reference Project",
                    ),
                    detailsSubTxt(
                      subtext: dataa["ref_url"] ?? "Not available",
                    ).paddingSymmetric(vertical: size10),
                    const Text(
                      "Write Comments",
                      style: TextStyle(
                          fontSize: size16, fontWeight: FontWeight.w500),
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
              );
            }
          }),
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
