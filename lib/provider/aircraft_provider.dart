import 'package:flutter/material.dart';
import '../models/aircrat_model.dart';
import '../services/api_service.dart';

class AircraftProvider extends ChangeNotifier {
  late AirCraftModel aircraftListModel = AirCraftModel();
  bool loading = false;
  ApiService services = ApiService();
  getAircraftPostData(context) async {
    loading = true;
    AirCraftModel? result = await services.getAircraftlistData(context);
    aircraftListModel = result ?? AirCraftModel();
    loading = false;
    notifyListeners();
  }
}