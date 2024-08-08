import 'package:accordion/accordion.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:tms/assets/spacing.dart';
import 'package:tms/components/build_button.dart';
import 'package:tms/components/text.dart';
import 'package:tms/components/textfield.dart';

class RolesScreen extends StatefulWidget {
  const RolesScreen({super.key});

  @override
  State<RolesScreen> createState() => _RolesScreenState();
}

class _RolesScreenState extends State<RolesScreen> {
  bool _isChecked1 = false;
  bool _isChecked2 = false;
  bool _isChecked3 = false;
  bool _isChecked4 = false;
  //users

  int _selecteduser = -1;

  void _onItemTapped(int index) {
    setState(() {
      _selecteduser = index;
    });
  }

//role
  int _selectedrole = -1;

  void _onItemTappedRole(int index) {
    setState(() {
      _selectedrole = index;
    });
  }

//tasks
  int _selectedtask = -1;

  void _onItemTappedTask(int index) {
    setState(() {
      _selectedtask = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Add Roles"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            text("Role Name", fontWeight: FontWeight.w400, fontSize: size18),
            textField(
              hint: "Enter Role Name",
              maxline: 1,
              height: size50,
            ),
            text("Permissions", fontWeight: FontWeight.w400, fontSize: size18),
            text("Select permissions for the role",
                fontWeight: FontWeight.w300, textColor: grey, fontSize: size13),
            Accordion(
                paddingListHorizontal: 0,
                maxOpenSections: 6,
                disableScrolling: true,
                children: [
                  AccordionSection(
                      headerPadding:
                          const EdgeInsets.symmetric(vertical: size5),
                      contentBorderRadius: double.infinity,
                      headerBackgroundColor: Colors.transparent,
                      contentBorderColor:
                          const Color.fromARGB(0, 167, 131, 131),
                      isOpen: false,
                      rightIcon: const Icon(Icons.keyboard_arrow_down),
                      header: const Text(
                        "Users",
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: size20),
                      ),
                      content: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(size12)),
                        child: Column(
                          children: [
                            CheckboxListTile(
                              title: const Text("view users"),
                              value: _isChecked1,
                              onChanged: (bool? value) {
                                setState(() {
                                  _isChecked1 = value!;
                                });
                              },
                            ),
                            CheckboxListTile(
                              title: const Text("create users"),
                              value: _isChecked2,
                              onChanged: (bool? value) {
                                setState(() {
                                  _isChecked2 = value!;
                                });
                              },
                            ),
                            CheckboxListTile(
                              title: const Text("update users"),
                              value: _isChecked3,
                              onChanged: (bool? value) {
                                setState(() {
                                  _isChecked3 = value!;
                                });
                              },
                            ),
                            CheckboxListTile(
                              title: const Text("delete users"),
                              value: _isChecked4,
                              onChanged: (bool? value) {
                                setState(() {
                                  _isChecked4 = value!;
                                });
                              },
                            ),
                          ],
                        ),
                      )),
                  AccordionSection(
                      headerPadding:
                          const EdgeInsets.symmetric(vertical: size5),
                      contentBorderRadius: double.infinity,
                      headerBackgroundColor: Colors.transparent,
                      contentBorderColor:
                          const Color.fromARGB(0, 167, 131, 131),
                      isOpen: false,
                      rightIcon: const Icon(Icons.keyboard_arrow_down),
                      header: const Text(
                        "Roles",
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: size20),
                      ),
                      content: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(size12)),
                        child: Column(
                          children: [
                            CheckboxListTile(
                              title: const Text("view roles"),
                              value: _isChecked1,
                              onChanged: (bool? value) {
                                setState(() {
                                  _isChecked1 = value!;
                                });
                              },
                            ),
                            CheckboxListTile(
                              title: const Text("create roles"),
                              value: _isChecked2,
                              onChanged: (bool? value) {
                                setState(() {
                                  _isChecked2 = value!;
                                });
                              },
                            ),
                            CheckboxListTile(
                              title: const Text("update roles"),
                              value: _isChecked3,
                              onChanged: (bool? value) {
                                setState(() {
                                  _isChecked3 = value!;
                                });
                              },
                            ),
                            CheckboxListTile(
                              title: const Text("delete roles"),
                              value: _isChecked4,
                              onChanged: (bool? value) {
                                setState(() {
                                  _isChecked4 = value!;
                                });
                              },
                            ),
                          ],
                        ),
                      )),
                  AccordionSection(
                      headerPadding:
                          const EdgeInsets.symmetric(vertical: size5),
                      contentBorderRadius: double.infinity,
                      headerBackgroundColor: Colors.transparent,
                      contentBorderColor:
                          const Color.fromARGB(0, 167, 131, 131),
                      isOpen: false,
                      rightIcon: const Icon(Icons.keyboard_arrow_down),
                      header: const Text(
                        "Tasks",
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: size20),
                      ),
                      content: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(size12)),
                        child: Column(
                          children: [
                            CheckboxListTile(
                              title: const Text("view tasks"),
                              value: _isChecked1,
                              onChanged: (bool? value) {
                                setState(() {
                                  _isChecked1 = value!;
                                });
                              },
                            ),
                            CheckboxListTile(
                              title: const Text("create tasks"),
                              value: _isChecked2,
                              onChanged: (bool? value) {
                                setState(() {
                                  _isChecked2 = value!;
                                });
                              },
                            ),
                            CheckboxListTile(
                              title: const Text("update tasks"),
                              value: _isChecked3,
                              onChanged: (bool? value) {
                                setState(() {
                                  _isChecked3 = value!;
                                });
                              },
                            ),
                            CheckboxListTile(
                              title: const Text("delete tasks"),
                              value: _isChecked4,
                              onChanged: (bool? value) {
                                setState(() {
                                  _isChecked4 = value!;
                                });
                              },
                            ),
                          ],
                        ),
                      )),
                  AccordionSection(
                      headerPadding:
                          const EdgeInsets.symmetric(vertical: size5),
                      contentBorderRadius: double.infinity,
                      headerBackgroundColor: Colors.transparent,
                      contentBorderColor:
                          const Color.fromARGB(0, 167, 131, 131),
                      isOpen: false,
                      rightIcon: const Icon(Icons.keyboard_arrow_down),
                      header: const Text(
                        "Projects",
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: size20),
                      ),
                      content: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(size12)),
                        child: Column(
                          children: [
                            CheckboxListTile(
                              title: const Text("view project"),
                              value: _isChecked1,
                              onChanged: (bool? value) {
                                setState(() {
                                  _isChecked1 = value!;
                                });
                              },
                            ),
                            CheckboxListTile(
                              title: const Text("create project"),
                              value: _isChecked2,
                              onChanged: (bool? value) {
                                setState(() {
                                  _isChecked2 = value!;
                                });
                              },
                            ),
                            CheckboxListTile(
                              title: const Text("update project"),
                              value: _isChecked3,
                              onChanged: (bool? value) {
                                setState(() {
                                  _isChecked3 = value!;
                                });
                              },
                            ),
                            CheckboxListTile(
                              title: const Text("delete project"),
                              value: _isChecked4,
                              onChanged: (bool? value) {
                                setState(() {
                                  _isChecked4 = value!;
                                });
                              },
                            ),
                          ],
                        ),
                      )),
                  AccordionSection(
                      headerPadding:
                          const EdgeInsets.symmetric(vertical: size5),
                      contentBorderRadius: double.infinity,
                      headerBackgroundColor: Colors.transparent,
                      contentBorderColor:
                          const Color.fromARGB(0, 167, 131, 131),
                      isOpen: false,
                      rightIcon: const Icon(Icons.keyboard_arrow_down),
                      header: const Text(
                        "Departments",
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: size20),
                      ),
                      content: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(size12)),
                        child: Column(
                          children: [
                            CheckboxListTile(
                              title: const Text("view Departments"),
                              value: _isChecked1,
                              onChanged: (bool? value) {
                                setState(() {
                                  _isChecked1 = value!;
                                });
                              },
                            ),
                            CheckboxListTile(
                              title: const Text("create Departments"),
                              value: _isChecked2,
                              onChanged: (bool? value) {
                                setState(() {
                                  _isChecked2 = value!;
                                });
                              },
                            ),
                            CheckboxListTile(
                              title: const Text("update Departments"),
                              value: _isChecked3,
                              onChanged: (bool? value) {
                                setState(() {
                                  _isChecked3 = value!;
                                });
                              },
                            ),
                            CheckboxListTile(
                              title: const Text("delete Departments"),
                              value: _isChecked4,
                              onChanged: (bool? value) {
                                setState(() {
                                  _isChecked4 = value!;
                                });
                              },
                            ),
                          ],
                        ),
                      )),
                  AccordionSection(
                      headerPadding:
                          const EdgeInsets.symmetric(vertical: size5),
                      contentBorderRadius: double.infinity,
                      headerBackgroundColor: Colors.transparent,
                      contentBorderColor:
                          const Color.fromARGB(0, 167, 131, 131),
                      isOpen: false,
                      rightIcon: const Icon(Icons.keyboard_arrow_down),
                      header: const Text(
                        "JD Tasks",
                        style: TextStyle(
                            fontWeight: FontWeight.w400, fontSize: size20),
                      ),
                      content: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(size12)),
                        child: Column(
                          children: [
                            CheckboxListTile(
                              title: const Text("view jd task"),
                              value: _isChecked1,
                              onChanged: (bool? value) {
                                setState(() {
                                  _isChecked1 = value!;
                                });
                              },
                            ),
                            CheckboxListTile(
                              title: const Text("create jd tasks"),
                              value: _isChecked2,
                              onChanged: (bool? value) {
                                setState(() {
                                  _isChecked2 = value!;
                                });
                              },
                            ),
                            CheckboxListTile(
                              title: const Text("update jd tasks"),
                              value: _isChecked3,
                              onChanged: (bool? value) {
                                setState(() {
                                  _isChecked3 = value!;
                                });
                              },
                            ),
                            CheckboxListTile(
                              title: const Text("delete jd tasks"),
                              value: _isChecked4,
                              onChanged: (bool? value) {
                                setState(() {
                                  _isChecked4 = value!;
                                });
                              },
                            ),
                          ],
                        ),
                      )),
                ]),
            Align(
              alignment: Alignment.center,
              child: BuildButton(
                  onPressed: () {},
                  width: MediaQuery.sizeOf(context).width * .4,
                  text: "Save"),
            )
          ],
        ).paddingAll(size20),
      ),
    );
  }
}
