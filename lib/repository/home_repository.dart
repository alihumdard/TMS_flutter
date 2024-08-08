import "package:provider/provider.dart";
import 'package:tms/data/network/networkApiServices.dart';
import 'package:tms/res/appUrl.dart';
import 'package:tms/view%20model/auth_view_model.dart';

class HomeRepository {
  NetworkApiServices apiServices = NetworkApiServices();

  // getAllProjects........
  Future<dynamic> getAllProjects(context) async {
    var provider = Provider.of<AuthViewModel>(context, listen: false);
    var headers = {'Authorization': 'Bearer ${provider.token}'};
    try {
      dynamic response =
          await apiServices.getApi(AppUrls.urlGetAllProject, headers);
      return response;
    } catch (e) {
      throw e.toString();
    }
  }

  // getSingleProjectDetails...........
  Future<dynamic> getSingleProjectDetails(context, String id) async {
    var provider = Provider.of<AuthViewModel>(context, listen: false);
    var headers = {'Authorization': 'Bearer ${provider.token}'};
    try {
      dynamic response =
          await apiServices.getApi(AppUrls.urlGetSingleProject + id, headers);

      return response;
    } catch (e) {
      throw e.toString();
    }
  }
}
