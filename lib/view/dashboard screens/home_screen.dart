import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:provider/provider.dart';
import 'package:tms/assets/colors.dart';
import 'package:tms/assets/images.dart';
import 'package:tms/assets/spacing.dart';
import 'package:tms/components/text.dart';
import 'package:tms/components/textfield.dart';
import 'package:tms/view%20model/auth_view_model.dart';
import 'package:tms/view/auth%20screens/login_screen.dart';
import 'package:tms/view/dashboard%20screens/companies_screen.dart';
import 'package:tms/view/dashboard%20screens/department_screen.dart';
import 'package:tms/view/dashboard%20screens/notification_screen.dart';
import 'package:tms/view/dashboard%20screens/profile_screen.dart';
import 'package:tms/view/dashboard%20screens/project_screen.dart';
import 'package:tms/view/dashboard%20screens/roles_screen.dart';
import 'package:tms/view/dashboard%20screens/task_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    var orientation = MediaQuery.of(context).orientation;
    var provider = Provider.of<AuthViewModel>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        actions: [
          IconButton(
              onPressed: () {
                const ProfileScreen().launch(context);
              },
              icon: SvgPicture.asset(svg_person)),
          IconButton(
              onPressed: () {
                const NotificationScreen().launch(context);
              },
              icon: SvgPicture.asset(svg_notification)),
          IconButton(onPressed: () {}, icon: SvgPicture.asset(svg_setting)),
        ],
      ),
      drawer: Drawer(
        width: size.width * .8,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ListTile(
                  leading: Container(
                    width: 70,
                    height: 70,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        image_profile,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  title: text("Waheed",
                      textColor: primary_color, fontWeight: FontWeight.w500),
                  subtitle: text("Software Engineer",
                      textColor: primary_color, fontWeight: FontWeight.w300),
                ).paddingSymmetric(vertical: size30),
                // drawerListtile(
                //   txt: "DashBoard",
                //   icon: Icons.home_filled,
                //   ontap: () {},
                // ),
                drawerListtile(
                  txt: "Roles",
                  icon: Icons.person_pin_outlined,
                  ontap: () {
                    const RolesScreen().launch(context);
                  },
                ),
                drawerListtile(
                  txt: "Users",
                  icon: Icons.person,
                  ontap: () {},
                ),
                drawerListtile(
                  txt: "Companies",
                  icon: Icons.store_mall_directory_outlined,
                  ontap: () {
                    const CompanyScreen().launch(context);
                  },
                ),
                drawerListtile(
                  txt: "JD Task",
                  icon: Icons.post_add,
                  ontap: () {},
                ),
                drawerListtile(
                  txt: "Departments",
                  icon: Icons.home_work_outlined,
                  ontap: () {
                    const DepartmentScreen().launch(context);
                  },
                ),
                drawerListtile(
                  txt: "Projects",
                  icon: Icons.folder_open,
                  ontap: () {
                    const ProjectScreen().launch(context);
                  },
                ),
                drawerListtile(
                  txt: "Tasks",
                  icon: Icons.format_list_numbered_sharp,
                  ontap: () {
                    const TasksScreen().launch(context);
                  },
                ),
                drawerListtile(
                  txt: "Sign Out",
                  icon: Icons.logout,
                  ontap: () async {
                    const LoginScreen().launch(context);
                    toast("Sign Out successfully",
                        bgColor: redColor, textColor: white);
                    await provider.deleteToken();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      body: WillPopScope(
        onWillPop: () async {
          bool exitConfirmed = await showDialog(
            context: context,
            builder: (context) => const appDismisDiolog(),
          );

          if (exitConfirmed ?? false) {
            SystemNavigator.pop();

            return true;
          } else {
            return false;
          }
        },
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Icon(
                    Icons.home_filled,
                    color: primary_color,
                    size: size30,
                  ).paddingRight(size10),
                  text("Dashboard",
                      fontSize: size20,
                      textColor: primary_color,
                      fontWeight: FontWeight.w600),
                ],
              ).paddingBottom(size20),
              text("Hi, Waheed",
                  fontSize: size12,
                  textColor: grey,
                  fontWeight: FontWeight.w400),
              text("Let’s be productive today!",
                      fontSize: size16, fontWeight: FontWeight.w400)
                  .paddingBottom(size15),
              textField(
                height: size50,
                hint: "Search task",
                maxline: 1,
                suffix: const Icon(Icons.search),
              ).paddingBottom(size10),
              GridView.builder(
                itemCount: dashboardgradview.length,
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: size10,
                    crossAxisSpacing: size10,
                    childAspectRatio:
                        orientation == Orientation.portrait ? 1 : 2,
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(size16),
                      gradient: LinearGradient(
                        colors: [primary_color, primary_color.withOpacity(.4)],
                        begin: Alignment.topLeft,
                        end: Alignment.topRight,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        text(dashboardgradview[index].task_amount,
                                textColor: white,
                                fontSize: size30,
                                fontWeight: FontWeight.w500)
                            .paddingBottom(size15),
                        text(dashboardgradview[index].tasks,
                                textColor: white,
                                fontSize: size16,
                                fontWeight: FontWeight.w400)
                            .paddingBottom(size15),
                      ],
                    ).paddingAll(size25),
                  );
                },
              ).paddingBottom(size20),
              Row(
                children: [
                  Expanded(
                    child: Container(
                        height: size50,
                        decoration: BoxDecoration(
                          // color: black,
                          borderRadius: BorderRadius.circular(size16),
                          gradient: LinearGradient(
                            colors: [greenColor, greenColor.withOpacity(.3)],
                            begin: Alignment.topLeft,
                            end: Alignment.topRight,
                          ),
                        ),
                        child: Center(
                          child: RichText(
                            text: const TextSpan(
                              // style: DefaultTextStyle.of(context).style,
                              children: [
                                TextSpan(
                                  text: "22",
                                  style: TextStyle(
                                      wordSpacing: 5.0,
                                      fontWeight: FontWeight.w500,
                                      fontSize: size20,
                                      color: white),
                                ),
                                WidgetSpan(
                                    child: SizedBox(
                                  width: size10,
                                )),
                                TextSpan(
                                  text: "Projects",
                                  style: TextStyle(
                                    wordSpacing: 5.0,
                                    color: white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: size16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )),
                  ),
                  const SizedBox(
                    width: size10,
                  ),
                  Expanded(
                    child: Container(
                        height: size50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(size16),
                          gradient: LinearGradient(
                            colors: [redColor, redColor.withOpacity(.3)],
                            begin: Alignment.topLeft,
                            end: Alignment.topRight,
                          ),
                        ),
                        child: Center(
                          child: RichText(
                            text: const TextSpan(
                              children: [
                                TextSpan(
                                  text: "5",
                                  style: TextStyle(
                                      wordSpacing: 5.0,
                                      fontWeight: FontWeight.w500,
                                      fontSize: size20,
                                      color: white),
                                ),
                                WidgetSpan(
                                    child: SizedBox(
                                  width: size10,
                                )),
                                TextSpan(
                                  text: "Missed Tasks",
                                  style: TextStyle(
                                    wordSpacing: 5.0,
                                    color: white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: size16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )),
                  )
                ],
              )
            ],
          ).paddingAll(size20),
        ),
      ),
    );
  }
}

//DashBoard Model
class DashboardGradView {
  String? task_amount, tasks;
  List<Color>? color;
  DashboardGradView({this.task_amount, this.tasks, this.color});
}

final dashboardgradview = [
  DashboardGradView(
      task_amount: "4",
      tasks: "Today's Task",
      color: [primary_color, primary_color.withOpacity(.4)]),
  DashboardGradView(
      task_amount: "12",
      tasks: "Weekly Task",
      color: [primary_color, primary_color.withOpacity(.4)]),
  DashboardGradView(
      task_amount: "44",
      tasks: "Monthly Task",
      color: [primary_color, primary_color.withOpacity(.4)]),
  DashboardGradView(
      task_amount: "60",
      tasks: "Total Task",
      color: [greenColor, primary_color.withOpacity(.4)]),
];

class drawerListtile extends StatelessWidget {
  IconData? icon;
  String? txt;
  VoidCallback? ontap;
  drawerListtile({
    this.icon,
    this.txt,
    this.ontap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: ontap,
      // contentPadding: const EdgeInsets.all(0),
      leading: Icon(
        icon,
        size: size30,
      ),
      title: text(txt, fontSize: size18, fontWeight: FontWeight.w400),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: size20,
      ),
    );
  }
}
//dismissable diolog

class appDismisDiolog extends StatelessWidget {
  const appDismisDiolog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      // title: const Text('Exit App'),
      content: const Text(
        'Do you want to exit the app?',
        textAlign: TextAlign.center,
      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(false); // Don't exit
              },
              child: const Text('No'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(true); // Confirm exit
              },
              child: const Text('Yes'),
            ),
          ],
        ),
      ],
    );
  }
}
