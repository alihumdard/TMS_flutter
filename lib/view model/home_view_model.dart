import 'package:flutter/material.dart';
import 'package:tms/repository/home_repository.dart';

class HomeViewModel with ChangeNotifier {
  final homeRepository = HomeRepository();
// getAllProject..............................................................>>
  Future getAllProjects(BuildContext context) async {
    return homeRepository.getAllProjects(context);
  }

  // getSingleProjectDetails..............................................................>>
  Future getSingalOrderDetails(BuildContext context, String id) async {
    return homeRepository.getSingleProjectDetails(context, id);
  }
}
