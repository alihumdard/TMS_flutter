import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:tms/assets/colors.dart';
import 'package:tms/assets/spacing.dart';
import 'package:tms/components/text.dart';
import 'package:tms/view%20model/home_view_model.dart';
import 'package:tms/view/dashboard%20screens/add_project.dart';
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
          centerTitle: true,
          title: const Text("Projects"),
          actions: [
            FloatingActionButton(
              onPressed: () {
                const AddProjectScreen().launch(context);
              },
              backgroundColor: primary_color,
              child: const Icon(
                Icons.add,
                color: white,
              ),
            ).paddingAll(size8)
          ],
        ),
        body: WillPopScope(
          onWillPop: () async {
            await const DashBoardScreen().launch(context);

            return true;
          },
          child: FutureBuilder(
              future: HomeViewModel().getAllProjects(context),
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
                  var dataa = snapshot.data["data"];
                  return Column(
                    children: [
                      Expanded(
                        child: ListView.builder(
                          itemCount: dataa.length,
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            var dataProject = dataa[index];

                            return Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15.0),
                                // color: primary_color,
                                gradient: LinearGradient(
                                  colors: [
                                    primary_color,
                                    primary_color.withOpacity(.3)
                                  ],
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
                                title: text(dataProject["name"] ?? "------",
                                    textColor: white,
                                    fontWeight: FontWeight.bold),
                                subtitle: text(
                                  dataProject['description'] ?? "-------",
                                  textColor: white,
                                  fontWeight: FontWeight.w400,
                                  fontSize: size14,
                                ),
                                trailing: GestureDetector(
                                  onTap: () {
                                    ProjectDetailsScreen(
                                      id: dataa[index],
                                    ).launch(context);
                                  },
                                  child: Container(
                                      width: size50,
                                      decoration: BoxDecoration(
                                          color: white,
                                          borderRadius:
                                              BorderRadius.circular(size15)),
                                      child: const Center(
                                          child: Icon(
                                        Icons.visibility,
                                        color: primary_color,
                                        size: size20,
                                      ))).paddingAll(10.0),
                                ),
                              ),
                            ).paddingBottom(size8);
                          },
                        ),
                      )
                    ],
                  ).paddingAll(size20);
                }
              }),
        ));
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
