import 'package:authentication/models/select_user_model.dart';
import 'package:flutter/cupertino.dart';
import '../services/api_service.dart';

class SelectUserProvider extends ChangeNotifier {
  late SelectUserModel docListModel = SelectUserModel();
  bool loading = false;
  ApiService services = ApiService();
  getDocumentType(context) async {
    loading = true;
    SelectUserModel? result = (await services.getSelectUser(context)) as SelectUserModel?;
    docListModel = result ?? SelectUserModel();
    loading = false;
    notifyListeners();
  }
}




