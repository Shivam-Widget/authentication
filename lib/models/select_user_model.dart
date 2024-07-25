import 'dart:convert';

SelectUserModel selectUserFromJson(String str) => SelectUserModel.fromJson(json.decode(str));

String selectUserToJson(SelectUserModel data) => json.encode(data.toJson());

class SelectUserModel {
  List<Datum>? data;
  dynamic exception;
  String? message;
  int? status;

  SelectUserModel({
    this.data,
    this.exception,
    this.message,
    this.status,
  });

  factory SelectUserModel.fromJson(Map<String, dynamic> json) => SelectUserModel(
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
    exception: json["exception"],
    message: json["message"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
    "exception": exception,
    "message": message,
    "status": status,
  };
}

class Datum {
  int? id;
  String? name;

  Datum({
    this.id,
    this.name,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
