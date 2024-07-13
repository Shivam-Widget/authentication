import 'package:authentication/models/reservation_model.dart';
import 'package:flutter/material.dart';
import '../services/api_service.dart';

class ReservationProvider extends ChangeNotifier {
  late ReservationModel reservation = ReservationModel();
  // late ReservationDetailModel reservationDetailModel = ReservationDetailModel();

  bool loading = false;
  ApiService services = ApiService();
  int page = 1;
  int length = 20;
  bool hasMore = true;

  Future<void> getReservationPostData(context, {bool loadMore = false}) async {
    if (loading) return;

    loading = true;

    if (!loadMore) {
      page = 1;
      reservation = ReservationModel();
      hasMore = true;
    }

    ReservationModel? result =
        await services.getReservationData(context, page, length);
    if (result != null && result.data != null && result.data!.isNotEmpty) {
      if (loadMore) {
        reservation.data?.addAll(result.data!);
      } else {
        reservation = result;
      }
      page++;
    } else {
      hasMore = false;
    }
    loading = false;

    notifyListeners();
  }

  getRecentFlightData(context) async {
    loading = true;
    ReservationModel? result = await services.getRecentFlightData(context);
    reservation = result ?? ReservationModel();
    loading = false;

    notifyListeners();
  }

  getReservaionDetailData(context,int id) async {
    loading = true;
    // ReservationDetailModel? result = await services.getReservationDetail(context,id);
    // reservationDetailModel = result ?? ReservationDetailModel();
    loading = false;

    notifyListeners();
  }
}
