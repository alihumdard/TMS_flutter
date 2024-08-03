import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:tms/assets/colors.dart';
import 'package:tms/assets/spacing.dart';
import 'package:tms/components/text.dart';
import 'package:tms/view/dashboard%20screens/dashboard_screen.dart';

class DepartmentScreen extends StatefulWidget {
  const DepartmentScreen({super.key});

  @override
  State<DepartmentScreen> createState() => _DepartmentScreenState();
}

class _DepartmentScreenState extends State<DepartmentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: text("Departments"),
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
                  itemCount: departmentModel.length,
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
                        title: text(departmentModel[index].name,
                            textColor: white, fontWeight: FontWeight.bold),
                        subtitle: text(departmentModel[index].email,
                            textColor: white, overFlow: TextOverflow.ellipsis),
                        trailing: text(
                            "${departmentModel[index].members} members",
                            textColor: white,
                            fontSize: size13,
                            fontWeight: FontWeight.w600),
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

//departments model

class DepartmentsModel {
  String? name, email, members;
  DepartmentsModel({this.name, this.email, this.members});
}

final departmentModel = [
  DepartmentsModel(
      name: "HR & Management",
      email: "maryam@techsolutionspro.co.uk",
      members: "2"),
  DepartmentsModel(
      name: "Business Development",
      email: "rabearaiz17500@gmail.com	",
      members: "2"),
  DepartmentsModel(
      name: "Graphic Designing",
      email: "shadbaher1542@gmail.com	",
      members: "5"),
  DepartmentsModel(name: "SEO", email: "seotspteam@gmail.com", members: "3"),
  DepartmentsModel(
      name: "HR", email: "hr@techsolutionspro.co.uk", members: "1"),
  DepartmentsModel(
      name: "Social Media Management",
      email: "socialmediamarketingtsp@gmail.com",
      members: "2"),
  DepartmentsModel(
      name: "Digital Marketing",
      email: "digital.marketing@techsolutionspro.co.uk",
      members: "1"),
  DepartmentsModel(
      name: "Content Department",
      email: "contentwritingtspteam@gmail.com",
      members: "1"),
  DepartmentsModel(
      name: "Software Development",
      email: "developertspteam@gmail.com",
      members: "8"),
];
