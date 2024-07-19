import 'dart:convert';

ScheduleModel welcomeFromJson(String str) => ScheduleModel.fromJson(json.decode(str));

String welcomeToJson(ScheduleModel data) => json.encode(data.toJson());

class ScheduleModel {
  List<dynamic>? data;
  dynamic exception;
  String? message;
  int? status;

  ScheduleModel({
    this.data,
    this.exception,
    this.message,
    this.status,
  });

  factory ScheduleModel.fromJson(Map<String, dynamic> json) => ScheduleModel(
    data: json["data"] == null ? [] : List<dynamic>.from(json["data"]!.map((x) => x)),
    exception: json["exception"],
    message: json["message"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x)),
    "exception": exception,
    "message": message,
    "status": status,
  };
}
