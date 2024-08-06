import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:tms/assets/colors.dart';
import 'package:tms/assets/spacing.dart';
import 'package:tms/components/text.dart';

class TaskDetailsScreen extends StatefulWidget {
  String? priority,
      status,
      assignTo,
      date,
      project,
      title,
      department,
      assignedBy,
      performance,
      actions;
  Color? statusclr, priorityClr;
  TaskDetailsScreen(
      {this.title,
      this.actions,
      this.assignTo,
      this.assignedBy,
      this.date,
      this.department,
      this.performance,
      this.priority,
      this.priorityClr,
      this.project,
      this.status,
      this.statusclr,
      super.key});

  @override
  State<TaskDetailsScreen> createState() => _TaskDetailsScreenState();
}

class _TaskDetailsScreenState extends State<TaskDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Task Details"),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [primary_color, primary_color.withOpacity(.5)],
              begin: Alignment.topLeft,
              end: Alignment.topRight,
            ),
            borderRadius: BorderRadius.circular(size20)),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListTile(
                isThreeLine: true,
                title: text(widget.project,
                    fontSize: size16,
                    textColor: white,
                    fontWeight: FontWeight.w600),
                subtitle: text(widget.title,
                    fontSize: size14,
                    textColor: white,
                    fontWeight: FontWeight.w400),
                trailing: Container(
                  height: size40,
                  width: MediaQuery.sizeOf(context).width * .3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(size20),
                    color: widget.statusclr,
                  ),
                  child: Center(
                    child: text(widget.status,
                            fontSize: size16,
                            textColor: white,
                            fontWeight: FontWeight.bold)
                        .paddingAll(size5),
                  ),
                ),
              ).paddingBottom(size20),
              ListTile(
                isThreeLine: true,
                title: text("By: ${widget.assignedBy}",
                    fontSize: size16,
                    textColor: white,
                    fontWeight: FontWeight.w600),
                subtitle: text("To: ${widget.assignTo}",
                    fontSize: size14,
                    textColor: white,
                    fontWeight: FontWeight.w400),
                trailing: Container(
                  height: size40,
                  width: MediaQuery.sizeOf(context).width * .3,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(size20),
                    color: widget.priorityClr,
                  ),
                  child: Center(
                    child: text(widget.priority,
                            fontSize: size16,
                            textColor: white,
                            fontWeight: FontWeight.bold)
                        .paddingAll(size5),
                  ),
                ),
              ).paddingBottom(size20),
              ListTile(
                isThreeLine: true,
                title: text(widget.department,
                    textColor: white,
                    fontSize: size16,
                    fontWeight: FontWeight.w600),
                subtitle: text(widget.performance,
                    fontSize: size14,
                    textColor: white,
                    fontWeight: FontWeight.w400),
                trailing: text(widget.date,
                    fontSize: size15,
                    textColor: white,
                    fontWeight: FontWeight.w500),
              ).paddingBottom(size20),
              Container(
                height: size40,
                width: MediaQuery.sizeOf(context).width * .5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(size20),
                  color: redColor,
                ),
                child: Center(
                  child: text(widget.actions,
                          fontSize: size16,
                          textColor: white,
                          fontWeight: FontWeight.bold)
                      .paddingAll(size5),
                ),
              ),
            ],
          ).paddingAll(size20),
        ),
      ).paddingAll(size10),
    );
  }
}
