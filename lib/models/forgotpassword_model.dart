// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

ForgotPasswordModel forgotPasswordFromJson(String str) =>
    ForgotPasswordModel.fromJson(json.decode(str));

String forgotPasswordToJson(ForgotPasswordModel data) =>
    json.encode(data.toJson());

class ForgotPasswordModel {
  bool? data;
  dynamic exception;
  String? message;
  int? status;

  ForgotPasswordModel({
    this.data,
    this.exception,
    this.message,
    this.status,
  });

  factory ForgotPasswordModel.fromJson(Map<String, dynamic> json) =>
      ForgotPasswordModel(
        data: json["data"],
        exception: json["exception"],
        message: json["message"],
        status: json["status"],
      );

  Map<String, dynamic> toJson() => {
        "data": data,
        "exception": exception,
        "message": message,
        "status": status,
      };
}
