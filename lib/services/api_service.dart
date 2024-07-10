import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/login_model.dart';

class ApiService {
  Future<LoginModel> apiCallLogin(Map<String, dynamic> param) async {
    var url = Uri.parse(
        'https://fly-manager-dev-api.azurewebsites.net/api/Account/login',

    );
    var res = await http.post(url, body: param,
    headers: {
      'accept' : '*/*',
      'Content-Type' : 'application/json-patch+json',
    }
    );
    debugPrint('res status: ${res.statusCode}');
    debugPrint('res status: ${res.body}');
    final data = jsonDecode(res.body);
    return LoginModel(token: data['accessToken'], error: data['error']);
  }
}




// import 'dart:convert';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../models/login_model.dart';
// import '../models/forgotpassword_model.dart';
//
// class ApiService {
//   static const String _url = '';
//   // static String? accessToken = SharedPreferencesHelper.accessToken;
//
//   // static  int? compamyId = SharedPreferencesHelper.companyId;
//   // static  int? userId = SharedPreferencesHelper.userId;
//   // static  int? roleId = SharedPreferencesHelper.roleId;
//
//   Future<LoginModel?> login({
//     required String email,
//     required String password,
//   }) async {
//     final Map<String, String> headers = {
//       'Content-Type': 'application/json',
//       'accept': '*/*',
//     };
//
//     final Map<String, dynamic> requestBody = {
//       'email': email,
//       'password': password,
//       'timeZone': 'Asia/Kolkata',
//       'deviceType': 'android',
//       'deviceToken': 'string',
//       'rememberMe': true,
//       'lattitude': 0,
//       'longitude': 0,
//       'operatingSystem': 'string',
//       'browserName': 'string',
//       'browserVersion': 'string',
//       'appVersion': 'string',
//     };
//
//     final String jsonBody = jsonEncode(requestBody);
//
//     try {
//       final response = await http.post(
//         Uri.parse(_url),
//         headers: headers,
//         body: jsonBody,
//       );
//
//       if (response.statusCode == 200) {
//         final item = json.decode(response.body);
//         debugPrint(item.toString());
//         SharedPreferences prefss = await SharedPreferences.getInstance();
//         await prefss.setBool('isLoggedIn', true);
//         await prefss.setString('accessToken', item['data']['accessToken']);
//         await prefss.setInt('companyId', item['data']['companyId']);
//         await prefss.setInt('id', item['data']['id']);
//         await prefss.setInt('roleId', item['data']['roleId']);
//         await prefss.setString('imageUrl', item['data']['imageUrl']);
//         return LoginModel.fromJson(
//             item); // Mapping json response to our data model
//       } else {
//         debugPrint('Error occurred: ${response.statusCode} ${response.body}');
//         return null;
//       }
//     } catch (e) {
//       debugPrint('Error occurred: $e');
//       return null;
//     }
//   }
//
//   Future<ForgotPasswordModel?> forgotpassword(BuildContext context, {
//     required String email,
//   }) async {
//     final Map<String, String> headers = {
//       'Content-Type': 'application/json',
//       'accept': '*/*',
//       // 'authorization': "$accessToken"
//     };
//
//     final Map<String, dynamic> requestBody = {
//       'email': email,
//       'resetURL': '',
//     };
//
//     final String jsonBody = jsonEncode(requestBody);
//
//     try {
//       final response = await http.post(
//         Uri.parse(''),
//         headers: headers,
//         body: jsonBody,
//       );
//
//       if (response.statusCode == 200) {
//         final item = json.decode(response.body);
//         debugPrint(item.toString());
//         return ForgotPasswordModel.fromJson(
//             item); // Mapping json response to our data model
//       } else {
//         debugPrint('Error occurred: ${response.statusCode} ${response.body}');
//         return null;
//       }
//     } catch (e) {
//       debugPrint('Error occurred: $e');
//       return null;
//     }
//   }
//
//
// //
// // Future<Reservation?> getReservationData(context, int page, int length) async {
// //   Reservation? reservation;
// //
// //   final Map<String, String> headers = {
// //     'Content-Type': 'application/json',
// //     'accept': '*/*',
// //     'authorization': "$accessToken"
// //   };
// //
// //   final Map<String, dynamic> requestBody = {
// //     "AircraftId": 0,
// //     "CompanyId": compamyId,
// //     "Length": length,
// //     "OrderType": "desc",
// //     "ReservationType": 0,
// //     "SearchText": "",
// //     "SortOrderColumn": "StartDateTime",
// //     "Start": page,
// //     "UserId": userId
// //   };
// //
// //   final String jsonBody = jsonEncode(requestBody);
// //
// //   try {
// //     final response = await http.post(
// //       Uri.parse(
// //           Constants.BASE_URL + ApiEndpoints.reservationlist),
// //       headers: headers,
// //       body: jsonBody,
// //     );
// //
// //     final responseData = ResponseHandler.handleResponse(context, response);
// //     if (responseData != null) {
// //       reservation = Reservation.fromJson(responseData);
// //     }
// //
// //   } catch (e) {
// //     print('Error Occurred' + e.toString());
// //   }
// //   return reservation;
// // }
// //
// // Future<Reservation?> getRecentFlightData(context) async {
// //   Reservation? reservation;
// //
// //   final Map<String, String> headers = {
// //     'Content-Type': 'application/json',
// //     'accept': '*/*',
// //     'authorization': "$accessToken"
// //   };
// //
// //   final Map<String, dynamic> requestBody = {
// //     "AircraftId": 0,
// //     "CompanyId": compamyId,
// //     "Length": 40,
// //     "OrderType": "desc",
// //     "ReservationType": 4,
// //     "SearchText": "",
// //     "SortOrderColumn": "StartDateTime",
// //     "Start": 1,
// //     "UserId": userId
// //   };
// //
// //   final String jsonBody = jsonEncode(requestBody);
// //
// //   try {
// //     final response = await http.post(
// //       Uri.parse(
// //           Constants.BASE_URL + ApiEndpoints.reservationlist),
// //       headers: headers,
// //       body: jsonBody,
// //     );
// //
// //     final responseData = ResponseHandler.handleResponse(context, response);
// //     if (responseData != null) {
// //       reservation = Reservation.fromJson(responseData);
// //     }
// //
// //   } catch (e) {
// //     print('Error Occurred' + e.toString());
// //   }
// //   return reservation;
// // }
// //
// // Future<AircraftListModel?> getAircraftlistData(context) async {
// //   AircraftListModel? aircraftListModel;
// //
// //   final Map<String, String> headers = {
// //     'Content-Type': 'application/json',
// //     'accept': '*/*',
// //     'authorization': "$accessToken"
// //   };
// //
// //   final Map<String, dynamic> requestBody = {
// //     "companyId": compamyId,
// //     "isActive": true,
// //     "isFavourite": false,
// //     "length": 20,
// //     "orderType": "desc",
// //     "searchText": "",
// //     "sortOrderColumn": "startTime",
// //     "start": 1
// //   };
// //
// //   final String jsonBody = jsonEncode(requestBody);
// //
// //   try {
// //     final response = await http.post(
// //       Uri.parse(
// //           Constants.BASE_URL + ApiEndpoints.aircraftlist),
// //       headers: headers,
// //       body: jsonBody,
// //     );
// //
// //     final responseData = ResponseHandler.handleResponse(context, response);
// //     if (responseData != null) {
// //       aircraftListModel = AircraftListModel.fromJson(responseData);
// //     }
// //
// //   } catch (e) {
// //     print('Error Occurred' + e.toString());
// //   }
// //   return aircraftListModel;
// // }
// }