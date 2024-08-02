import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:tms/assets/spacing.dart';
import 'package:tms/components/text.dart';

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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [text("Tasks will show here")],
          ).paddingAll(size20),
        ),
      ),
    );
  }
}
