import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:tms/assets/spacing.dart';
import 'package:tms/components/text.dart';

class ProjectScreen extends StatefulWidget {
  const ProjectScreen({super.key});

  @override
  State<ProjectScreen> createState() => _ProjectScreenState();
}

class _ProjectScreenState extends State<ProjectScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: text("Projects"),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [text("Projects will show here")],
          ).paddingAll(size20),
        ),
      ),
    );
  }
}
