import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:tms/assets/colors.dart';
import 'package:tms/view/dashboard%20screens/department_screen.dart';
import 'package:tms/view/dashboard%20screens/home_screen.dart';
import 'package:tms/view/dashboard%20screens/project_screen.dart';
import 'package:tms/view/dashboard%20screens/task_screen.dart';

class DashBoardScreen extends StatefulWidget {
  const DashBoardScreen({super.key});

  @override
  _DashBoardScreenState createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
  int selectedIndex = 0;

  List<IconData> navbarIconsSvgs = [
    Icons.home_filled,
    Icons.home_work_outlined,
    Icons.folder_open_outlined,
    Icons.format_list_numbered_sharp
  ];

  @override
  Widget build(BuildContext context) {
    List widgets = <Widget>[
      const HomeScreen(),
      const DepartmentScreen(),
      const ProjectScreen(),
      const TasksScreen(),
    ];

    var bottomNavigator = Container(
      decoration: boxDecorationDefault(
          borderRadius: radius(0), color: context.cardColor),
      padding: const EdgeInsets.only(bottom: 8, left: 20, right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: navbarIconsSvgs.map(
          (e) {
            int i = navbarIconsSvgs.indexOf(e);
            return AnimatedContainer(
              duration: const Duration(milliseconds: 100),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 45,
                    height: 5,
                    decoration: BoxDecoration(
                      color: primary_color,
                      borderRadius: radiusOnly(bottomLeft: 5, bottomRight: 5),
                    ),
                  ).visible(i == selectedIndex),
                  IconButton(
                    icon: Icon(
                      e,
                      size: 30.0,
                      color: i == selectedIndex
                          ? primary_color
                          : Colors.blueGrey[300],
                    ),
                    onPressed: () {
                      selectedIndex = i;
                      setState(() {});
                    },
                  ),
                ],
              ),
            );
          },
        ).toList(),
      ),
    );
    return Scaffold(
      body: widgets[selectedIndex],
      bottomNavigationBar: bottomNavigator,
    );
  }
}
