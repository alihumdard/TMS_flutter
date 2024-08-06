import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:tms/assets/colors.dart';
import 'package:tms/assets/spacing.dart';
import 'package:tms/components/text.dart';
import 'package:tms/view/dashboard%20screens/add_tasks.dart';
import 'package:tms/view/dashboard%20screens/dashboard_screen.dart';
import 'package:tms/view/dashboard%20screens/task_details.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Tasks"),
        actions: [
          FloatingActionButton(
            onPressed: () {
              const AddTasksScreen().launch(context);
            },
            backgroundColor: primary_color,
            child: const Icon(
              Icons.add,
              color: white,
            ),
          ).paddingAll(size8),
        ],
      ),
      body: WillPopScope(
        onWillPop: () async {
          await const DashBoardScreen().launch(context);

          return true;
        },
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: taskModel.length,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(size12),
                        gradient: LinearGradient(
                          colors: [
                            primary_color,
                            primary_color.withOpacity(.5)
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.topRight,
                        ),
                      ),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              text("${taskModel[index].task_project} ",
                                  fontSize: size16,
                                  textColor: white,
                                  fontWeight: FontWeight.bold),
                              Container(
                                height: size40,
                                width: MediaQuery.sizeOf(context).width * .3,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(size20),
                                  color: taskModel[index].statusColor,
                                ),
                                child: Center(
                                  child: text(
                                          "${taskModel[index].task_status} ",
                                          fontSize: size16,
                                          textColor: white,
                                          fontWeight: FontWeight.bold)
                                      .paddingAll(size5),
                                ),
                              )
                            ],
                          ).paddingBottom(size10),
                          Row(
                            children: [
                              text("To: ",
                                  fontSize: size16,
                                  textColor: white,
                                  fontWeight: FontWeight.w400),
                              text("${taskModel[index].task_assignTo} ",
                                  fontSize: size16,
                                  textColor: white,
                                  fontWeight: FontWeight.bold),
                              const Spacer(),
                              text("By: ",
                                  fontSize: size16,
                                  textColor: white,
                                  // decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.w400),
                              text("${taskModel[index].task_assignedBy} ",
                                  fontSize: size16,
                                  textColor: white,
                                  fontWeight: FontWeight.bold),
                            ],
                          ).paddingBottom(size10),
                          GestureDetector(
                            onTap: () {
                              TaskDetailsScreen(
                                title: taskModel[index].task_title,
                                actions: taskModel[index].task_action,
                                assignTo: taskModel[index].task_assignTo,
                                assignedBy: taskModel[index].task_assignedBy,
                                date: taskModel[index].task_dueDate,
                                department: taskModel[index].task_department,
                                performance: taskModel[index].task_performance,
                                priority: taskModel[index].task_priority,
                                priorityClr: taskModel[index].priorityColor,
                                statusclr: taskModel[index].statusColor,
                                project: taskModel[index].task_project,
                                status: taskModel[index].task_status,
                              ).launch(context);
                            },
                            child: Container(
                              height: size40,
                              width: MediaQuery.sizeOf(context).width * .3,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(size20),
                                color: white,
                              ),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    text("Details",
                                        fontSize: size16,
                                        textColor: black,
                                        fontWeight: FontWeight.bold),
                                    const Icon(Icons.arrow_forward)
                                        .paddingSymmetric(horizontal: size10)
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ).paddingAll(size12),
                    ).paddingBottom(size10);
                  },
                ),
              )
            ],
          ).paddingAll(size20),
        ),
      ),
    );
  }
}

//tasks Model
class TaskModel {
  String? task_priority,
      task_status,
      task_assignTo,
      task_assignedBy,
      task_dueDate,
      task_project,
      task_title,
      task_department,
      task_performance,
      task_action;
  Color? statusColor, priorityColor;
  TaskModel(
      {this.task_action,
      this.task_assignTo,
      this.statusColor,
      this.priorityColor,
      this.task_assignedBy,
      this.task_department,
      this.task_performance,
      this.task_dueDate,
      this.task_priority,
      this.task_project,
      this.task_status,
      this.task_title});
}

final taskModel = [
  TaskModel(
      task_action: "Delete Task",
      task_assignTo: "Usama Badar",
      task_assignedBy: "Ali Humdard",
      priorityColor: redColor,
      statusColor: grey,
      task_department: "Software Development",
      task_performance: "DeadLine Missed",
      task_dueDate: "1/08/2024",
      task_priority: "High",
      task_project: "Online Pharmacy",
      task_status: "Completed",
      task_title: "Dynamic the menu with lastest design.(ateshambranch)"),
  TaskModel(
      task_action: "Delete Task",
      task_assignTo: "Sajid Mirza",
      task_assignedBy: "Shad Baher",
      priorityColor: redColor,
      statusColor: primary_color,
      task_department: "Graphic Designing",
      task_performance: "DeadLine Missed",
      task_dueDate: "1/07/2024",
      task_priority: "High",
      task_project: "TMS Solution",
      task_status: "Assigned",
      task_title: "TMS Logo"),
  TaskModel(
      task_action: "Delete Task",
      task_assignTo: "Sarosh Malik",
      task_assignedBy: "M Shafique",
      priorityColor: grey,
      statusColor: greenColor,
      task_department: "SEO",
      task_performance: "DeadLine Missed",
      task_dueDate: "1/06/2024",
      task_priority: "Medium",
      task_project: "Tech Solution Pro",
      task_status: "Closed",
      task_title: "Task Assignment	"),
  TaskModel(
      task_action: "Delete Task",
      task_assignTo: "Usama Badar",
      task_assignedBy: "Ali Humdard",
      priorityColor: redColor,
      statusColor: grey,
      task_department: "Software Development",
      task_performance: "DeadLine Missed",
      task_dueDate: "1/08/2024",
      task_priority: "High",
      task_project: "Online Pharmacy",
      task_status: "Completed",
      task_title: "Dynamic the menu with lastest design.(ateshambranch)"),
  TaskModel(
      task_action: "Delete Task",
      task_assignTo: "Sajid Mirza",
      task_assignedBy: "Shad Baher",
      priorityColor: redColor,
      statusColor: primary_color,
      task_department: "Graphic Designing",
      task_performance: "DeadLine Missed",
      task_dueDate: "1/07/2024",
      task_priority: "High",
      task_project: "TMS Solution",
      task_status: "Assigned",
      task_title: "TMS Logo"),
  TaskModel(
      task_action: "Delete Task",
      task_assignTo: "Sarosh Malik",
      task_assignedBy: "M Shafique",
      priorityColor: grey,
      statusColor: greenColor,
      task_department: "SEO",
      task_performance: "DeadLine Missed",
      task_dueDate: "1/06/2024",
      task_priority: "Medium",
      task_project: "Tech Solution Pro",
      task_status: "Closed",
      task_title: "Task Assignment	"),
];
