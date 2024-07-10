import 'dart:convert';

LoginModel welcomeFromJson(String str) => LoginModel.fromJson(json.decode(str));

String welcomeToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  GetAllData? data;
  dynamic exception;
  String? message;
  String? token;
  String? error;
  int? status;

  LoginModel({
    this.data,
    this.exception,
    this.message,
    this.status,
    this.token,
    this.error,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    data: json["data"] == null ? null : GetAllData.fromJson(json["data"]),
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

class GetAllData {
  int? id;
  String? email;
  String? accessToken;
  String? refreshToken;
  String? firstName;
  String? lastName;
  String? phone;
  int? roleId;
  String? companyName;
  int? companyId;
  dynamic externalId;
  String? imageUrl;
  DateTime? dateofBirth;
  dynamic gender;
  List<UserPermissionList>? userPermissionList;
  String? localTimeZone;
  String? dateFormat;
  bool? isSwitchedAccount;
  int? switchedByUserId;
  int? switchedByRoleId;
  int? switchedByCompanyId;
  bool? isPhoneVerified;

  GetAllData({
    this.id,
    this.email,
    this.accessToken,
    this.refreshToken,
    this.firstName,
    this.lastName,
    this.phone,
    this.roleId,
    this.companyName,
    this.companyId,
    this.externalId,
    this.imageUrl,
    this.dateofBirth,
    this.gender,
    this.userPermissionList,
    this.localTimeZone,
    this.dateFormat,
    this.isSwitchedAccount,
    this.switchedByUserId,
    this.switchedByRoleId,
    this.switchedByCompanyId,
    this.isPhoneVerified,
  });

  factory GetAllData.fromJson(Map<String, dynamic> json) => GetAllData(
    id: json["id"],
    email: json["email"],
    accessToken: json["accessToken"],
    refreshToken: json["refreshToken"],
    firstName: json["firstName"],
    lastName: json["lastName"],
    phone: json["phone"],
    roleId: json["roleId"],
    companyName: json["companyName"],
    companyId: json["companyId"],
    externalId: json["externalId"],
    imageUrl: json["imageURL"],
    dateofBirth: json["dateofBirth"] == null ? null : DateTime.parse(json["dateofBirth"]),
    gender: json["gender"],
    userPermissionList: json["userPermissionList"] == null ? [] : List<UserPermissionList>.from(json["userPermissionList"]!.map((x) => UserPermissionList.fromJson(x))),
    localTimeZone: json["localTimeZone"],
    dateFormat: json["dateFormat"],
    isSwitchedAccount: json["isSwitchedAccount"],
    switchedByUserId: json["switchedByUserId"],
    switchedByRoleId: json["switchedByRoleId"],
    switchedByCompanyId: json["switchedByCompanyId"],
    isPhoneVerified: json["isPhoneVerified"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "email": email,
    "accessToken": accessToken,
    "refreshToken": refreshToken,
    "firstName": firstName,
    "lastName": lastName,
    "phone": phone,
    "roleId": roleId,
    "companyName": companyName,
    "companyId": companyId,
    "externalId": externalId,
    "imageURL": imageUrl,
    "dateofBirth": dateofBirth?.toIso8601String(),
    "gender": gender,
    "userPermissionList": userPermissionList == null ? [] : List<dynamic>.from(userPermissionList!.map((x) => x.toJson())),
    "localTimeZone": localTimeZone,
    "dateFormat": dateFormat,
    "isSwitchedAccount": isSwitchedAccount,
    "switchedByUserId": switchedByUserId,
    "switchedByRoleId": switchedByRoleId,
    "switchedByCompanyId": switchedByCompanyId,
    "isPhoneVerified": isPhoneVerified,
  };
}

class UserPermissionList {
  int? roleId;
  RoleName? roleName;
  int? moduleId;
  String? moduleName;
  String? webPermissions;
  dynamic mobileAppPermissions;
  String? controllerName;
  ActionName? actionName;
  String? displayName;
  dynamic companyName;
  bool? isAllowed;
  bool? isAllowedForMobileApp;
  bool? isDisplayInLeftMenu;
  bool? isDisplayInMobileMenu;
  String? icon;
  String? mobileAppIcon;
  int? orderNo;
  int? totalRecords;
  bool? isAdministrationModule;
  dynamic webPermissionsList;
  dynamic mobilePermissionsList;
  bool? isLoadingEditButton;

  UserPermissionList({
    this.roleId,
    this.roleName,
    this.moduleId,
    this.moduleName,
    this.webPermissions,
    this.mobileAppPermissions,
    this.controllerName,
    this.actionName,
    this.displayName,
    this.companyName,
    this.isAllowed,
    this.isAllowedForMobileApp,
    this.isDisplayInLeftMenu,
    this.isDisplayInMobileMenu,
    this.icon,
    this.mobileAppIcon,
    this.orderNo,
    this.totalRecords,
    this.isAdministrationModule,
    this.webPermissionsList,
    this.mobilePermissionsList,
    this.isLoadingEditButton,
  });

  factory UserPermissionList.fromJson(Map<String, dynamic> json) => UserPermissionList(
    roleId: json["roleId"],
    roleName: roleNameValues.map[json["roleName"]]!,
    moduleId: json["moduleId"],
    moduleName: json["moduleName"],
    webPermissions: json["webPermissions"],
    mobileAppPermissions: json["mobileAppPermissions"],
    controllerName: json["controllerName"],
    actionName: actionNameValues.map[json["actionName"]]!,
    displayName: json["displayName"],
    companyName: json["companyName"],
    isAllowed: json["isAllowed"],
    isAllowedForMobileApp: json["isAllowedForMobileApp"],
    isDisplayInLeftMenu: json["isDisplayInLeftMenu"],
    isDisplayInMobileMenu: json["isDisplayInMobileMenu"],
    icon: json["icon"],
    mobileAppIcon: json["mobileAppIcon"],
    orderNo: json["orderNo"],
    totalRecords: json["totalRecords"],
    isAdministrationModule: json["isAdministrationModule"],
    webPermissionsList: json["webPermissionsList"],
    mobilePermissionsList: json["mobilePermissionsList"],
    isLoadingEditButton: json["isLoadingEditButton"],
  );

  Map<String, dynamic> toJson() => {
    "roleId": roleId,
    "roleName": roleNameValues.reverse[roleName],
    "moduleId": moduleId,
    "moduleName": moduleName,
    "webPermissions": webPermissions,
    "mobileAppPermissions": mobileAppPermissions,
    "controllerName": controllerName,
    "actionName": actionNameValues.reverse[actionName],
    "displayName": displayName,
    "companyName": companyName,
    "isAllowed": isAllowed,
    "isAllowedForMobileApp": isAllowedForMobileApp,
    "isDisplayInLeftMenu": isDisplayInLeftMenu,
    "isDisplayInMobileMenu": isDisplayInMobileMenu,
    "icon": icon,
    "mobileAppIcon": mobileAppIcon,
    "orderNo": orderNo,
    "totalRecords": totalRecords,
    "isAdministrationModule": isAdministrationModule,
    "webPermissionsList": webPermissionsList,
    "mobilePermissionsList": mobilePermissionsList,
    "isLoadingEditButton": isLoadingEditButton,
  };
}

enum ActionName {
  INDEX
}

final actionNameValues = EnumValues({
  "Index": ActionName.INDEX
});

enum RoleName {
  ADMIN
}

final roleNameValues = EnumValues({
  "Admin": RoleName.ADMIN
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

