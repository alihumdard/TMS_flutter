import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:tms/assets/spacing.dart';
import 'package:tms/components/build_button.dart';
import 'package:tms/components/text.dart';
import 'package:tms/components/textfield.dart';

class AddTasksScreen extends StatefulWidget {
  const AddTasksScreen({super.key});

  @override
  State<AddTasksScreen> createState() => _AddTasksScreenState();
}

class _AddTasksScreenState extends State<AddTasksScreen> {
  DateTime? selectedDate;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Add New Task"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            text("Department Name",
                fontSize: size14, fontWeight: FontWeight.w400),
            Container(
              height: size55,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                border: Border.all(color: gray),
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              child: Center(
                child: DropdownButtonFormField<String>(
                  borderRadius: BorderRadius.circular(size10),
                  hint: text("Select Department",
                      textColor: grey, fontWeight: FontWeight.w300),
                  decoration: const InputDecoration.collapsed(hintText: ''),
                  items: ['Management', 'Developers', 'Designers', "Others"]
                      .map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: text(value,
                          textColor: black, fontWeight: FontWeight.w400),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (kDebugMode) {
                      print('Selected: $value');
                    }
                  },
                ),
              ),
            ).paddingOnly(top: size10, bottom: size20),
            text("Project Name", fontSize: size14, fontWeight: FontWeight.w400),
            Container(
              height: size55,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                border: Border.all(color: gray),
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              child: Center(
                child: DropdownButtonFormField<String>(
                  borderRadius: BorderRadius.circular(size10),
                  hint: text("Select Project",
                      textColor: grey, fontWeight: FontWeight.w300),
                  decoration: const InputDecoration.collapsed(hintText: ''),
                  items: ['TMS', 'Online Pharmacy', 'TSP'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: text(value,
                          textColor: black, fontWeight: FontWeight.w400),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (kDebugMode) {
                      print('Selected: $value');
                    }
                  },
                ),
              ),
            ).paddingOnly(top: size10, bottom: size20),
            text("Priority", fontSize: size14, fontWeight: FontWeight.w400),
            Container(
              height: size55,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                border: Border.all(color: gray),
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              child: Center(
                child: DropdownButtonFormField<String>(
                  borderRadius: BorderRadius.circular(size10),
                  hint: text("Select Task Priority",
                      textColor: grey, fontWeight: FontWeight.w300),
                  decoration: const InputDecoration.collapsed(hintText: ''),
                  items: ['Low', 'Medium', 'High'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: text(value,
                          textColor: black, fontWeight: FontWeight.w400),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (kDebugMode) {
                      print('Selected: $value');
                    }
                  },
                ),
              ),
            ).paddingOnly(top: size10, bottom: size20),
            text("Status", fontSize: size14, fontWeight: FontWeight.w400),
            Container(
              height: size55,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                border: Border.all(color: gray),
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              child: Center(
                child: DropdownButtonFormField<String>(
                  borderRadius: BorderRadius.circular(size10),
                  hint: text("Select Status",
                      textColor: grey, fontWeight: FontWeight.w300),
                  decoration: const InputDecoration.collapsed(hintText: ''),
                  items: [
                    'Assign',
                    'Work Started',
                    'Invalid',
                    'Close',
                    'Complited',
                    'Revision'
                  ].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: text(value,
                          textColor: black, fontWeight: FontWeight.w400),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (kDebugMode) {
                      print('Selected: $value');
                    }
                  },
                ),
              ),
            ).paddingOnly(top: size10, bottom: size20),
            text("Assign To", fontSize: size14, fontWeight: FontWeight.w400),
            Container(
              height: size55,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                border: Border.all(color: gray),
                borderRadius: BorderRadius.circular(8),
                color: Colors.white,
              ),
              child: Center(
                child: DropdownButtonFormField<String>(
                  borderRadius: BorderRadius.circular(size10),
                  hint: text("Assigned To",
                      textColor: grey, fontWeight: FontWeight.w300),
                  decoration: const InputDecoration.collapsed(hintText: ''),
                  items: [
                    'Software Manager',
                  ].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: text(value,
                          textColor: black, fontWeight: FontWeight.w400),
                    );
                  }).toList(),
                  onChanged: (value) {
                    if (kDebugMode) {
                      print('Selected: $value');
                    }
                  },
                ),
              ),
            ).paddingOnly(top: size10, bottom: size20),
            text("Start Date", fontSize: size14, fontWeight: FontWeight.w400),
            Container(
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Colors.grey,
                  ),
                  color: white),
              child: Row(children: [
                text(
                  selectedDate == null
                      ? 'Select date'
                      : "${selectedDate!.toLocal()}".split(' ')[0],
                ),
                const Spacer(),
                IconButton(
                    onPressed: () {
                      _selectDate(context);
                    },
                    icon: const Icon(Icons.calendar_month)),
              ]).paddingSymmetric(horizontal: size10),
            ).paddingSymmetric(vertical: size15),
            text("End Date", fontSize: size14, fontWeight: FontWeight.w400),
            Container(
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Colors.grey,
                  ),
                  color: white),
              child: Row(children: [
                text(
                  selectedDate == null
                      ? 'Select date'
                      : "${selectedDate!.toLocal()}".split(' ')[0],
                ),
                const Spacer(),
                IconButton(
                    onPressed: () {
                      _selectDate(context);
                    },
                    icon: const Icon(Icons.calendar_month)),
              ]).paddingSymmetric(horizontal: size10),
            ).paddingSymmetric(vertical: size15),
            text("Task Title", fontSize: size14, fontWeight: FontWeight.w400),
            textField(
              maxline: 1,
              hint: "Enter Task Description",
              height: size50,
            ),
            text("Task Description",
                fontSize: size14, fontWeight: FontWeight.w400),
            textField(
              maxline: 2,
              hint: "Enter task title",
              height: size100,
            ),
            Align(
              alignment: Alignment.center,
              child: BuildButton(
                  width: MediaQuery.sizeOf(context).width * .4,
                  height: size40,
                  onPressed: () {
                    finish(context);
                    toast("Project Added!",
                        bgColor: greenColor, textColor: white);
                  },
                  text: "Submit"),
            ).paddingSymmetric(vertical: size20)
          ],
        ).paddingAll(size20),
      ),
    );
  }
}
