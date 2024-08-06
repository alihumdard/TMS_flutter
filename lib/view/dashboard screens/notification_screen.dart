import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:tms/assets/colors.dart';
import 'package:tms/assets/spacing.dart';
import 'package:tms/components/text.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Notifications"),
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            text("Today", fontWeight: FontWeight.bold, fontSize: size16)
                .paddingBottom(size20),
            buildNotification(
              title: "New Task Assigned	",
              desc: "A new task is assigned to you by Ali Humdard	",
              color: primary_color.withOpacity(.3),
            ),
            buildNotification(
              title: "Task Updated	",
              desc: "You task is updated to you by Mudassar Hussain	",
              color: white,
            ).paddingBottom(size20),
            text("Yesterday", fontWeight: FontWeight.bold, fontSize: size16)
                .paddingBottom(size20),
            buildNotification(
              title: "New Comment",
              desc: "A new comment is added by Ali Humdard",
              color: primary_color.withOpacity(.3),
            ).paddingBottom(size10),
            buildNotification(
              title: "New Task Assigned	",
              desc: "A new task is assigned to you by Ali Humdard	",
              color: primary_color.withOpacity(.3),
            ),
            buildNotification(
              title: "Task Updated	",
              desc: "You task is updated to you by Mudassar Hussain	",
              color: white,
            ),
            buildNotification(
              title: "New Task Assigned	",
              desc: "A new task is assigned to you by Ali Humdard	",
              color: white,
            ),
          ],
        ).paddingAll(size20),
      ),
    );
  }
}

class buildNotification extends StatelessWidget {
  var title, desc;
  Color? color;
  buildNotification({
    this.title,
    this.desc,
    this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(size12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          text(title, fontWeight: FontWeight.bold, fontSize: size16)
              .paddingBottom(size10),
          text(desc,
                  fontWeight: FontWeight.w400,
                  textColor: gray,
                  fontSize: size14)
              .paddingBottom(size5),
          text("15 days ago",
                  fontWeight: FontWeight.w400,
                  textColor: gray,
                  fontSize: size14)
              .paddingBottom(size10),
        ],
      ).paddingAll(size12),
    );
  }
}
