class AirCraftModel {
  List<Datum>? data;
  dynamic exception;
  String? message;
  int? status;

  AirCraftModel({
    this.data,
    this.exception,
    this.message,
    this.status,
  });

  factory AirCraftModel.fromJson(Map<String, dynamic> json) => AirCraftModel(
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
  String? tailNo;
  String? imageName;
  int? companyId;
  String? imagePath;
  bool? isLoadingEditButton;
  int? aircraftStatusId;
  AircraftStatus? aircraftStatus;
  Indicator? indicator;
  String? year;
  CompanyName? companyName;
  String? makeName;
  String? modelName;
  Category? category;
  int? ownerId;
  bool? isLockedForUpdate;
  bool? isFavourite;
  int? totalRecords;
  DateTime? createdOn;
  DateTime? updatedOn;
  String? createdByName;

  Datum({
    this.id,
    this.tailNo,
    this.imageName,
    this.companyId,
    this.imagePath,
    this.isLoadingEditButton,
    this.aircraftStatusId,
    this.aircraftStatus,
    this.indicator,
    this.year,
    this.companyName,
    this.makeName,
    this.modelName,
    this.category,
    this.ownerId,
    this.isLockedForUpdate,
    this.isFavourite,
    this.totalRecords,
    this.createdOn,
    this.updatedOn,
    this.createdByName,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    tailNo: json["tailNo"],
    imageName: json["imageName"],
    companyId: json["companyId"],
    imagePath: json["imagePath"],
    isLoadingEditButton: json["isLoadingEditButton"],
    aircraftStatusId: json["aircraftStatusId"],
    aircraftStatus: aircraftStatusValues.map[json["aircraftStatus"]]!,
    indicator: indicatorValues.map[json["indicator"]]!,
    year: json["year"],
    companyName: companyNameValues.map[json["companyName"]]!,
    makeName: json["makeName"],
    modelName: json["modelName"],
    category: categoryValues.map[json["category"]]!,
    ownerId: json["ownerId"],
    isLockedForUpdate: json["isLockedForUpdate"],
    isFavourite: json["isFavourite"],
    totalRecords: json["totalRecords"],
    createdOn: json["createdOn"] == null ? null : DateTime.parse(json["createdOn"]),
    updatedOn: json["updatedOn"] == null ? null : DateTime.parse(json["updatedOn"]),
    createdByName: json["createdByName"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "tailNo": tailNo,
    "imageName": imageName,
    "companyId": companyId,
    "imagePath": imagePath,
    "isLoadingEditButton": isLoadingEditButton,
    "aircraftStatusId": aircraftStatusId,
    "aircraftStatus": aircraftStatusValues.reverse[aircraftStatus],
    "indicator": indicatorValues.reverse[indicator],
    "year": year,
    "companyName": companyNameValues.reverse[companyName],
    "makeName": makeName,
    "modelName": modelName,
    "category": categoryValues.reverse[category],
    "ownerId": ownerId,
    "isLockedForUpdate": isLockedForUpdate,
    "isFavourite": isFavourite,
    "totalRecords": totalRecords,
    "createdOn": createdOn?.toIso8601String(),
    "updatedOn": updatedOn?.toIso8601String(),
    "createdByName": createdByName,
  };
}

enum AircraftStatus {
  READY_FOR_FLIGHT
}

final aircraftStatusValues = EnumValues({
  "Ready For Flight": AircraftStatus.READY_FOR_FLIGHT
});

enum Category {
  AIRPLANE,
  FLIGHT_SIMULATOR,
  HELICOPTER_ROTORCRAFT
}

final categoryValues = EnumValues({
  "Airplane": Category.AIRPLANE,
  "Flight Simulator": Category.FLIGHT_SIMULATOR,
  "Helicopter/Rotorcraft": Category.HELICOPTER_ROTORCRAFT
});

enum CompanyName {
  UPFLYTE_DEMO
}

final companyNameValues = EnumValues({
  "Upflyte Demo": CompanyName.UPFLYTE_DEMO
});

enum Indicator {
  GREEN
}

final indicatorValues = EnumValues({
  "GREEN": Indicator.GREEN
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
