import 'package:authentication/models/schedule_model.dart';
import 'package:authentication/services/api_service.dart';
import 'package:flutter/material.dart';

class ScheduleProvider extends ChangeNotifier {
  late ScheduleModel scheduleModel = ScheduleModel();
  bool loading = false;
  ApiService service = ApiService();
  getSchedulePostData (context) async {
    loading = true;
    ScheduleModel? result = await service.getScheduleFlightData(context);
    scheduleModel = result ?? ScheduleModel();
    loading = false;
    notifyListeners();
  }
}