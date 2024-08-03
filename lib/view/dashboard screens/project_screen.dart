import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:tms/assets/colors.dart';
import 'package:tms/assets/spacing.dart';
import 'package:tms/components/text.dart';
import 'package:tms/view/dashboard%20screens/dashboard_screen.dart';
import 'package:tms/view/dashboard%20screens/project_details.dart';

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
                  itemCount: projectsModel.length,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0),
                        // color: primary_color,
                        gradient: const LinearGradient(
                          colors: [primary_color, purple],
                          begin: Alignment.topLeft,
                          end: Alignment.topRight,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: const Offset(0, 1),
                          ),
                        ],
                      ),
                      child: ListTile(
                        title: text(projectsModel[index].name,
                            textColor: white, fontWeight: FontWeight.bold),
                        subtitle: text(
                          projectsModel[index].status,
                          textColor: white,
                          fontWeight: FontWeight.w400,
                          fontSize: size14,
                        ),
                        trailing: GestureDetector(
                          onTap: () {
                            ProjectDetailsScreen(
                              topic: projectsModel[index].name,
                            ).launch(context);
                          },
                          child: Container(
                              width: size50,
                              decoration: BoxDecoration(
                                  color: grey.withOpacity(.8),
                                  borderRadius: BorderRadius.circular(size25)),
                              child: const Center(
                                  child: Icon(
                                Icons.visibility,
                                color: white,
                                size: size20,
                              ))).paddingAll(7.0),
                        ),
                      ),
                    ).paddingBottom(size8);
                  },
                ),
              )
            ],
          ).paddingSymmetric(horizontal: size20),
        ),
      ),
    );
  }
}

//project model

class ProjectsModel {
  String? name, status, members;
  ProjectsModel({this.name, this.status, this.members});
}

final projectsModel = [
  ProjectsModel(
      name: "4lifecarechesterfield", status: "Assigned", members: "2"),
  ProjectsModel(name: "Ammar Fragrances", status: "Assigned", members: "2"),
  ProjectsModel(name: "Buon Cleaning", status: "Assigned", members: "5"),
  ProjectsModel(name: "Buon Construction", status: "Assigned", members: "3"),
  ProjectsModel(name: "Ecogreens", status: "Assigned", members: "2"),
];
