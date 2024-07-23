// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

DocumentTypeModel documentTypeFromJson(String str) => DocumentTypeModel.fromJson(json.decode(str));

String documentTypeToJson(DocumentTypeModel data) => json.encode(data.toJson());

class DocumentTypeModel {
  Data? data;
  dynamic exception;
  String? message;
  int? status;

  DocumentTypeModel({
    this.data,
    this.exception,
    this.message,
    this.status,
  });

  factory DocumentTypeModel.fromJson(Map<String, dynamic> json) => DocumentTypeModel(
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
    exception: json["exception"],
    message: json["message"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "data": data?.toJson(),
    "exception": exception,
    "message": message,
    "status": status,
  };
}

class Data {
  String? id;
  dynamic name;
  dynamic displayName;
  dynamic type;
  int? size;
  dynamic totalDownloads;
  dynamic totalShares;
  dynamic lastShareDate;
  bool? isShareable;
  dynamic aircraftId;
  bool? isPersonalDocument;
  dynamic tags;
  dynamic expirationDate;
  int? companyId;
  int? userId;
  int? moduleId;
  dynamic documentDirectoryId;
  bool? isFromParentModule;
  dynamic documentVsDocumentTags;
  List<ModulesList>? modulesList;
  dynamic usersList;
  dynamic compniesList;
  dynamic documentTagsList;
  int? createdBy;
  DateTime? createdOn;
  dynamic moduleName;
  dynamic userName;
  dynamic documentPath;
  dynamic updatedBy;
  dynamic deletedBy;
  int? totalRecords;

  Data({
    this.id,
    this.name,
    this.displayName,
    this.type,
    this.size,
    this.totalDownloads,
    this.totalShares,
    this.lastShareDate,
    this.isShareable,
    this.aircraftId,
    this.isPersonalDocument,
    this.tags,
    this.expirationDate,
    this.companyId,
    this.userId,
    this.moduleId,
    this.documentDirectoryId,
    this.isFromParentModule,
    this.documentVsDocumentTags,
    this.modulesList,
    this.usersList,
    this.compniesList,
    this.documentTagsList,
    this.createdBy,
    this.createdOn,
    this.moduleName,
    this.userName,
    this.documentPath,
    this.updatedBy,
    this.deletedBy,
    this.totalRecords,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    name: json["name"],
    displayName: json["displayName"],
    type: json["type"],
    size: json["size"],
    totalDownloads: json["totalDownloads"],
    totalShares: json["totalShares"],
    lastShareDate: json["lastShareDate"],
    isShareable: json["isShareable"],
    aircraftId: json["aircraftId"],
    isPersonalDocument: json["isPersonalDocument"],
    tags: json["tags"],
    expirationDate: json["expirationDate"],
    companyId: json["companyId"],
    userId: json["userId"],
    moduleId: json["moduleId"],
    documentDirectoryId: json["documentDirectoryId"],
    isFromParentModule: json["isFromParentModule"],
    documentVsDocumentTags: json["documentVsDocumentTags"],
    modulesList: json["modulesList"] == null ? [] : List<ModulesList>.from(json["modulesList"]!.map((x) => ModulesList.fromJson(x))),
    usersList: json["usersList"],
    compniesList: json["compniesList"],
    documentTagsList: json["documentTagsList"],
    createdBy: json["createdBy"],
    createdOn: json["createdOn"] == null ? null : DateTime.parse(json["createdOn"]),
    moduleName: json["moduleName"],
    userName: json["userName"],
    documentPath: json["documentPath"],
    updatedBy: json["updatedBy"],
    deletedBy: json["deletedBy"],
    totalRecords: json["totalRecords"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "displayName": displayName,
    "type": type,
    "size": size,
    "totalDownloads": totalDownloads,
    "totalShares": totalShares,
    "lastShareDate": lastShareDate,
    "isShareable": isShareable,
    "aircraftId": aircraftId,
    "isPersonalDocument": isPersonalDocument,
    "tags": tags,
    "expirationDate": expirationDate,
    "companyId": companyId,
    "userId": userId,
    "moduleId": moduleId,
    "documentDirectoryId": documentDirectoryId,
    "isFromParentModule": isFromParentModule,
    "documentVsDocumentTags": documentVsDocumentTags,
    "modulesList": modulesList == null ? [] : List<dynamic>.from(modulesList!.map((x) => x.toJson())),
    "usersList": usersList,
    "compniesList": compniesList,
    "documentTagsList": documentTagsList,
    "createdBy": createdBy,
    "createdOn": createdOn?.toIso8601String(),
    "moduleName": moduleName,
    "userName": userName,
    "documentPath": documentPath,
    "updatedBy": updatedBy,
    "deletedBy": deletedBy,
    "totalRecords": totalRecords,
  };
}

class ModulesList {
  int? id;
  String? name;

  ModulesList({
    this.id,
    this.name,
  });

  factory ModulesList.fromJson(Map<String, dynamic> json) => ModulesList(
    id: json["id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
  };
}
