import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:tms/assets/spacing.dart';
import 'package:tms/components/text.dart';
import 'package:tms/view/dashboard%20screens/dashboard_screen.dart';

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
        title: text("Tasks"),
      ),
      body: WillPopScope(
        onWillPop: () async {
          await const DashBoardScreen().launch(context);

          return true;
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [text("Tasks will show here")],
            ).paddingAll(size20),
          ),
        ),
      ),
    );
  }
}
