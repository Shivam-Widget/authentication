// import 'dart:convert';
//
// ScheduleModel welcomeFromJson(String str) => ScheduleModel.fromJson(json.decode(str));
//
// String welcomeToJson(ScheduleModel data) => json.encode(data.toJson());
//
// class ScheduleModel {
//   List<dynamic>? data;
//   dynamic exception;
//   String? message;
//   int? status;
//
//   ScheduleModel({
//     this.data,
//     this.exception,
//     this.message,
//     this.status,
//   });
//
//   factory ScheduleModel.fromJson(Map<String, dynamic> json) => ScheduleModel(
//     data: json["data"] == null ? [] : List<dynamic>.from(json["data"]!.map((x) => x)),
//     exception: json["exception"],
//     message: json["message"],
//     status: json["status"],
//   );
//
//   Map<String, dynamic> toJson() => {
//     "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x)),
//     "exception": exception,
//     "message": message,
//     "status": status,
//   };
// }




// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

ScheduleModel scheduleModelFromJson(String str) => ScheduleModel.fromJson(json.decode(str));

String scheduleModelToJson(ScheduleModel data) => json.encode(data.toJson());

class ScheduleModel {
  List<Datum>? data;
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
  List<dynamic>? locationsList;
  dynamic locationId;
  List<dynamic>? scheduleActivitiesList;
  int? scheduleActivityId;
  DateTime? startTime;
  DateTime? endTime;
  bool? isRecurring;
  bool? isStandBy;
  int? companyId;
  int? userId;
  int? member1Id;
  String? member1;
  int? roleId;
  int? member2Id;
  bool? isDisplayMember2Dropdown;
  String? departureAirport;
  String? arrivalAirport;
  dynamic instructorId;
  int? aircraftId;
  String? tailNo;
  String? displayTitle;
  int? flightCategoryId;
  dynamic flightRoutes;
  String? comments;
  dynamic internalComments;
  dynamic flightType;
  dynamic flightRules;
  int? estHours;
  String? reservationId;
  bool? isCancelled;
  dynamic aircraftMaintenanceId;
  bool? isActive;
  bool? isDeleted;
  DateTime? createdOn;
  int? createdBy;
  dynamic updatedOn;
  dynamic updatedBy;
  dynamic deletedOn;
  dynamic deletedBy;
  dynamic flightTagIds;
  String? make;
  String? model;
  int? flightApprovalStatusId;
  dynamic flightApprovalStatus;
  int? flightCancellationReasonId;
  String? aircraftImage;
  dynamic flightCancellationReason;
  bool? isAllDay;
  dynamic cssClass;
  dynamic color;
  bool? isAllowToCheckDetails;
  bool? isCheckOut;
  String? flightStatus;
  bool? isRequiredToApprove;
  bool? isAllowToEnterAirportManually;
  List<dynamic>? departureAirportsList;
  dynamic arrivalAirportsList;
  dynamic instructorsList;
  dynamic aircraftsList;
  dynamic companiesList;
  dynamic flightCategoriesList;
  dynamic usersList;
  dynamic member1List;
  dynamic member2List;
  dynamic flightTagsList;
  AircraftSchedulerDetailsVm? aircraftSchedulerDetailsVm;
  List<dynamic>? aircraftEquipmentsTimeList;
  List<dynamic>? aircraftEquipmentHobbsTimeList;

  Datum({
    this.id,
    this.locationsList,
    this.locationId,
    this.scheduleActivitiesList,
    this.scheduleActivityId,
    this.startTime,
    this.endTime,
    this.isRecurring,
    this.isStandBy,
    this.companyId,
    this.userId,
    this.member1Id,
    this.member1,
    this.roleId,
    this.member2Id,
    this.isDisplayMember2Dropdown,
    this.departureAirport,
    this.arrivalAirport,
    this.instructorId,
    this.aircraftId,
    this.tailNo,
    this.displayTitle,
    this.flightCategoryId,
    this.flightRoutes,
    this.comments,
    this.internalComments,
    this.flightType,
    this.flightRules,
    this.estHours,
    this.reservationId,
    this.isCancelled,
    this.aircraftMaintenanceId,
    this.isActive,
    this.isDeleted,
    this.createdOn,
    this.createdBy,
    this.updatedOn,
    this.updatedBy,
    this.deletedOn,
    this.deletedBy,
    this.flightTagIds,
    this.make,
    this.model,
    this.flightApprovalStatusId,
    this.flightApprovalStatus,
    this.flightCancellationReasonId,
    this.aircraftImage,
    this.flightCancellationReason,
    this.isAllDay,
    this.cssClass,
    this.color,
    this.isAllowToCheckDetails,
    this.isCheckOut,
    this.flightStatus,
    this.isRequiredToApprove,
    this.isAllowToEnterAirportManually,
    this.departureAirportsList,
    this.arrivalAirportsList,
    this.instructorsList,
    this.aircraftsList,
    this.companiesList,
    this.flightCategoriesList,
    this.usersList,
    this.member1List,
    this.member2List,
    this.flightTagsList,
    this.aircraftSchedulerDetailsVm,
    this.aircraftEquipmentsTimeList,
    this.aircraftEquipmentHobbsTimeList,
  });

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    locationsList: json["locationsList"] == null ? [] : List<dynamic>.from(json["locationsList"]!.map((x) => x)),
    locationId: json["locationId"],
    scheduleActivitiesList: json["scheduleActivitiesList"] == null ? [] : List<dynamic>.from(json["scheduleActivitiesList"]!.map((x) => x)),
    scheduleActivityId: json["scheduleActivityId"],
    startTime: json["startTime"] == null ? null : DateTime.parse(json["startTime"]),
    endTime: json["endTime"] == null ? null : DateTime.parse(json["endTime"]),
    isRecurring: json["isRecurring"],
    isStandBy: json["isStandBy"],
    companyId: json["companyId"],
    userId: json["userId"],
    member1Id: json["member1Id"],
    member1: json["member1"],
    roleId: json["roleId"],
    member2Id: json["member2Id"],
    isDisplayMember2Dropdown: json["isDisplayMember2Dropdown"],
    departureAirport: json["departureAirport"],
    arrivalAirport: json["arrivalAirport"],
    instructorId: json["instructorId"],
    aircraftId: json["aircraftId"],
    tailNo: json["tailNo"],
    displayTitle: json["displayTitle"],
    flightCategoryId: json["flightCategoryId"],
    flightRoutes: json["flightRoutes"],
    comments: json["comments"],
    internalComments: json["internalComments"],
    flightType: json["flightType"],
    flightRules: json["flightRules"],
    estHours: json["estHours"],
    reservationId: json["reservationId"],
    isCancelled: json["isCancelled"],
    aircraftMaintenanceId: json["aircraftMaintenanceId"],
    isActive: json["isActive"],
    isDeleted: json["isDeleted"],
    createdOn: json["createdOn"] == null ? null : DateTime.parse(json["createdOn"]),
    createdBy: json["createdBy"],
    updatedOn: json["updatedOn"],
    updatedBy: json["updatedBy"],
    deletedOn: json["deletedOn"],
    deletedBy: json["deletedBy"],
    flightTagIds: json["flightTagIds"],
    make: json["make"],
    model: json["model"],
    flightApprovalStatusId: json["flightApprovalStatusId"],
    flightApprovalStatus: json["flightApprovalStatus"],
    flightCancellationReasonId: json["flightCancellationReasonId"],
    aircraftImage: json["aircraftImage"],
    flightCancellationReason: json["flightCancellationReason"],
    isAllDay: json["isAllDay"],
    cssClass: json["cssClass"],
    color: json["color"],
    isAllowToCheckDetails: json["isAllowToCheckDetails"],
    isCheckOut: json["isCheckOut"],
    flightStatus: json["flightStatus"],
    isRequiredToApprove: json["isRequiredToApprove"],
    isAllowToEnterAirportManually: json["isAllowToEnterAirportManually"],
    departureAirportsList: json["departureAirportsList"] == null ? [] : List<dynamic>.from(json["departureAirportsList"]!.map((x) => x)),
    arrivalAirportsList: json["arrivalAirportsList"],
    instructorsList: json["instructorsList"],
    aircraftsList: json["aircraftsList"],
    companiesList: json["companiesList"],
    flightCategoriesList: json["flightCategoriesList"],
    usersList: json["usersList"],
    member1List: json["member1List"],
    member2List: json["member2List"],
    flightTagsList: json["flightTagsList"],
    aircraftSchedulerDetailsVm: json["aircraftSchedulerDetailsVM"] == null ? null : AircraftSchedulerDetailsVm.fromJson(json["aircraftSchedulerDetailsVM"]),
    aircraftEquipmentsTimeList: json["aircraftEquipmentsTimeList"] == null ? [] : List<dynamic>.from(json["aircraftEquipmentsTimeList"]!.map((x) => x)),
    aircraftEquipmentHobbsTimeList: json["aircraftEquipmentHobbsTimeList"] == null ? [] : List<dynamic>.from(json["aircraftEquipmentHobbsTimeList"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "locationsList": locationsList == null ? [] : List<dynamic>.from(locationsList!.map((x) => x)),
    "locationId": locationId,
    "scheduleActivitiesList": scheduleActivitiesList == null ? [] : List<dynamic>.from(scheduleActivitiesList!.map((x) => x)),
    "scheduleActivityId": scheduleActivityId,
    "startTime": startTime?.toIso8601String(),
    "endTime": endTime?.toIso8601String(),
    "isRecurring": isRecurring,
    "isStandBy": isStandBy,
    "companyId": companyId,
    "userId": userId,
    "member1Id": member1Id,
    "member1": member1,
    "roleId": roleId,
    "member2Id": member2Id,
    "isDisplayMember2Dropdown": isDisplayMember2Dropdown,
    "departureAirport": departureAirport,
    "arrivalAirport": arrivalAirport,
    "instructorId": instructorId,
    "aircraftId": aircraftId,
    "tailNo": tailNo,
    "displayTitle": displayTitle,
    "flightCategoryId": flightCategoryId,
    "flightRoutes": flightRoutes,
    "comments": comments,
    "internalComments": internalComments,
    "flightType": flightType,
    "flightRules": flightRules,
    "estHours": estHours,
    "reservationId": reservationId,
    "isCancelled": isCancelled,
    "aircraftMaintenanceId": aircraftMaintenanceId,
    "isActive": isActive,
    "isDeleted": isDeleted,
    "createdOn": createdOn?.toIso8601String(),
    "createdBy": createdBy,
    "updatedOn": updatedOn,
    "updatedBy": updatedBy,
    "deletedOn": deletedOn,
    "deletedBy": deletedBy,
    "flightTagIds": flightTagIds,
    "make": make,
    "model": model,
    "flightApprovalStatusId": flightApprovalStatusId,
    "flightApprovalStatus": flightApprovalStatus,
    "flightCancellationReasonId": flightCancellationReasonId,
    "aircraftImage": aircraftImage,
    "flightCancellationReason": flightCancellationReason,
    "isAllDay": isAllDay,
    "cssClass": cssClass,
    "color": color,
    "isAllowToCheckDetails": isAllowToCheckDetails,
    "isCheckOut": isCheckOut,
    "flightStatus": flightStatus,
    "isRequiredToApprove": isRequiredToApprove,
    "isAllowToEnterAirportManually": isAllowToEnterAirportManually,
    "departureAirportsList": departureAirportsList == null ? [] : List<dynamic>.from(departureAirportsList!.map((x) => x)),
    "arrivalAirportsList": arrivalAirportsList,
    "instructorsList": instructorsList,
    "aircraftsList": aircraftsList,
    "companiesList": companiesList,
    "flightCategoriesList": flightCategoriesList,
    "usersList": usersList,
    "member1List": member1List,
    "member2List": member2List,
    "flightTagsList": flightTagsList,
    "aircraftSchedulerDetailsVM": aircraftSchedulerDetailsVm?.toJson(),
    "aircraftEquipmentsTimeList": aircraftEquipmentsTimeList == null ? [] : List<dynamic>.from(aircraftEquipmentsTimeList!.map((x) => x)),
    "aircraftEquipmentHobbsTimeList": aircraftEquipmentHobbsTimeList == null ? [] : List<dynamic>.from(aircraftEquipmentHobbsTimeList!.map((x) => x)),
  };
}

class AircraftSchedulerDetailsVm {
  int? id;
  int? aircraftScheduleId;
  String? flightStatus;
  dynamic checkInTime;
  String? airportReferenceId;
  dynamic checkOutTime;
  dynamic checkInBy;
  dynamic checkInByUserName;
  dynamic checkOutByUserName;
  dynamic checkOutBy;
  bool? isCheckOut;

  AircraftSchedulerDetailsVm({
    this.id,
    this.aircraftScheduleId,
    this.flightStatus,
    this.checkInTime,
    this.airportReferenceId,
    this.checkOutTime,
    this.checkInBy,
    this.checkInByUserName,
    this.checkOutByUserName,
    this.checkOutBy,
    this.isCheckOut,
  });

  factory AircraftSchedulerDetailsVm.fromJson(Map<String, dynamic> json) => AircraftSchedulerDetailsVm(
    id: json["id"],
    aircraftScheduleId: json["aircraftScheduleId"],
    flightStatus: json["flightStatus"],
    checkInTime: json["checkInTime"],
    airportReferenceId: json["airportReferenceId"],
    checkOutTime: json["checkOutTime"],
    checkInBy: json["checkInBy"],
    checkInByUserName: json["checkInByUserName"],
    checkOutByUserName: json["checkOutByUserName"],
    checkOutBy: json["checkOutBy"],
    isCheckOut: json["isCheckOut"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "aircraftScheduleId": aircraftScheduleId,
    "flightStatus": flightStatus,
    "checkInTime": checkInTime,
    "airportReferenceId": airportReferenceId,
    "checkOutTime": checkOutTime,
    "checkInBy": checkInBy,
    "checkInByUserName": checkInByUserName,
    "checkOutByUserName": checkOutByUserName,
    "checkOutBy": checkOutBy,
    "isCheckOut": isCheckOut,
  };
}

