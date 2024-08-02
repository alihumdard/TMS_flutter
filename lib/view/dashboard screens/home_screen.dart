import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:tms/assets/colors.dart';
import 'package:tms/assets/images.dart';
import 'package:tms/assets/spacing.dart';
import 'package:tms/components/text.dart';
import 'package:tms/components/textfield.dart';

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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
        actions: [
          IconButton(onPressed: () {}, icon: SvgPicture.asset(svg_person)),
          IconButton(
              onPressed: () {}, icon: SvgPicture.asset(svg_notification)),
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
                  leading: const CircleAvatar(
                    radius: size40,
                    backgroundColor: primary_color,
                    backgroundImage: AssetImage(image_profile),
                  ),
                  title: text("Waheed",
                      textColor: primary_color, fontWeight: FontWeight.w500),
                  subtitle: text("Software Engineer",
                      textColor: primary_color, fontWeight: FontWeight.w300),
                ).paddingSymmetric(vertical: size30),
                drawerListtile(
                  txt: "DashBoard",
                  icon: Icons.home_filled,
                  ontap: () {},
                ),
                drawerListtile(
                  txt: "Roles",
                  icon: Icons.person_pin_outlined,
                  ontap: () {},
                ),
                drawerListtile(
                  txt: "Users",
                  icon: Icons.person,
                  ontap: () {},
                ),
                drawerListtile(
                  txt: "Companies",
                  icon: Icons.home_work_outlined,
                  ontap: () {},
                ),
                drawerListtile(
                  txt: "JD Task",
                  icon: Icons.post_add,
                  ontap: () {},
                ),
                drawerListtile(
                  txt: "Departments",
                  icon: Icons.store_outlined,
                  ontap: () {},
                ),
                drawerListtile(
                  txt: "Projects",
                  icon: Icons.folder_open,
                  ontap: () {},
                ),
                drawerListtile(
                  txt: "Tasks",
                  icon: Icons.list_outlined,
                  ontap: () {},
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
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
                fontSize: size12, textColor: grey, fontWeight: FontWeight.w400),
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
                  childAspectRatio: orientation == Orientation.portrait ? 1 : 2,
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                      )
                      //  Row(
                      //   // mainAxisAlignment: MainAxisAlignment.start,
                      //   // crossAxisAlignment: CrossAxisAlignment.start,
                      //   children: [
                      //     text("22",
                      //             textColor: white,
                      //             fontSize: size30,
                      //             fontWeight: FontWeight.w500)
                      //         .paddingLeft(size10),
                      //     text("Projects",
                      //         textColor: white,
                      //         fontSize: size16,
                      //         fontWeight: FontWeight.w400),
                      //   ],
                      // ).paddingAll(size25),
                      ),
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
