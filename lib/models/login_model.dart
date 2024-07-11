// import 'dart:convert';
//
// LoginModel loginFromJson(String str) => LoginModel.fromJson(json.decode(str));
//
// String loginToJson(LoginModel data) => json.encode(data.toJson());
//
// class LoginModel {
//   GetAllData? data;
//   dynamic exception;
//   String? message;
//
//   int? status;
//
//   LoginModel({
//     this.data,
//     this.exception,
//     this.message,
//     this.status,
//   });
//
//   factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
//         data: json["data"] == null ? null : GetAllData.fromJson(json["data"]),
//         exception: json["exception"],
//         message: json["message"],
//         status: json["status"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "data": data?.toJson(),
//         "exception": exception,
//         "message": message,
//         "status": status,
//       };
// }
//
// class GetAllData {
//   int? id;
//   String? email;
//   String? accessToken;
//   String? refreshToken;
//   String? firstName;
//   String? lastName;
//   String? phone;
//   int? roleId;
//   String? companyName;
//   int? companyId;
//   dynamic externalId;
//   String? imageUrl;
//   DateTime? dateofBirth;
//   dynamic gender;
//   List<UserPermissionList>? userPermissionList;
//   String? localTimeZone;
//   String? dateFormat;
//   bool? isSwitchedAccount;
//   int? switchedByUserId;
//   int? switchedByRoleId;
//   int? switchedByCompanyId;
//   bool? isPhoneVerified;
//
//   GetAllData({
//     this.id,
//     this.email,
//     this.accessToken,
//     this.refreshToken,
//     this.firstName,
//     this.lastName,
//     this.phone,
//     this.roleId,
//     this.companyName,
//     this.companyId,
//     this.externalId,
//     this.imageUrl,
//     this.dateofBirth,
//     this.gender,
//     this.userPermissionList,
//     this.localTimeZone,
//     this.dateFormat,
//     this.isSwitchedAccount,
//     this.switchedByUserId,
//     this.switchedByRoleId,
//     this.switchedByCompanyId,
//     this.isPhoneVerified,
//   });
//
//   factory GetAllData.fromJson(Map<String, dynamic> json) => GetAllData(
//         id: json["id"],
//         email: json["email"],
//         accessToken: json["accessToken"],
//         refreshToken: json["refreshToken"],
//         firstName: json["firstName"],
//         lastName: json["lastName"],
//         phone: json["phone"],
//         roleId: json["roleId"],
//         companyName: json["companyName"],
//         companyId: json["companyId"],
//         externalId: json["externalId"],
//         imageUrl: json["imageURL"],
//         dateofBirth: json["dateofBirth"] == null
//             ? null
//             : DateTime.parse(json["dateofBirth"]),
//         gender: json["gender"],
//         userPermissionList: json["userPermissionList"] == null
//             ? []
//             : List<UserPermissionList>.from(json["userPermissionList"]!
//                 .map((x) => UserPermissionList.fromJson(x))),
//         localTimeZone: json["localTimeZone"],
//         dateFormat: json["dateFormat"],
//         isSwitchedAccount: json["isSwitchedAccount"],
//         switchedByUserId: json["switchedByUserId"],
//         switchedByRoleId: json["switchedByRoleId"],
//         switchedByCompanyId: json["switchedByCompanyId"],
//         isPhoneVerified: json["isPhoneVerified"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": id,
//         "email": email,
//         "accessToken": accessToken,
//         "refreshToken": refreshToken,
//         "firstName": firstName,
//         "lastName": lastName,
//         "phone": phone,
//         "roleId": roleId,
//         "companyName": companyName,
//         "companyId": companyId,
//         "externalId": externalId,
//         "imageURL": imageUrl,
//         "dateofBirth": dateofBirth?.toIso8601String(),
//         "gender": gender,
//         "userPermissionList": userPermissionList == null
//             ? []
//             : List<dynamic>.from(userPermissionList!.map((x) => x.toJson())),
//         "localTimeZone": localTimeZone,
//         "dateFormat": dateFormat,
//         "isSwitchedAccount": isSwitchedAccount,
//         "switchedByUserId": switchedByUserId,
//         "switchedByRoleId": switchedByRoleId,
//         "switchedByCompanyId": switchedByCompanyId,
//         "isPhoneVerified": isPhoneVerified,
//       };
// }
//
// class UserPermissionList {
//   int? roleId;
//   RoleName? roleName;
//   int? moduleId;
//   String? moduleName;
//   String? webPermissions;
//   dynamic mobileAppPermissions;
//   String? controllerName;
//   ActionName? actionName;
//   String? displayName;
//   dynamic companyName;
//   bool? isAllowed;
//   bool? isAllowedForMobileApp;
//   bool? isDisplayInLeftMenu;
//   bool? isDisplayInMobileMenu;
//   String? icon;
//   String? mobileAppIcon;
//   int? orderNo;
//   int? totalRecords;
//   bool? isAdministrationModule;
//   dynamic webPermissionsList;
//   dynamic mobilePermissionsList;
//   bool? isLoadingEditButton;
//
//   UserPermissionList({
//     this.roleId,
//     this.roleName,
//     this.moduleId,
//     this.moduleName,
//     this.webPermissions,
//     this.mobileAppPermissions,
//     this.controllerName,
//     this.actionName,
//     this.displayName,
//     this.companyName,
//     this.isAllowed,
//     this.isAllowedForMobileApp,
//     this.isDisplayInLeftMenu,
//     this.isDisplayInMobileMenu,
//     this.icon,
//     this.mobileAppIcon,
//     this.orderNo,
//     this.totalRecords,
//     this.isAdministrationModule,
//     this.webPermissionsList,
//     this.mobilePermissionsList,
//     this.isLoadingEditButton,
//   });
//
//   factory UserPermissionList.fromJson(Map<String, dynamic> json) =>
//       UserPermissionList(
//         roleId: json["roleId"],
//         roleName: roleNameValues.map[json["roleName"]]!,
//         moduleId: json["moduleId"],
//         moduleName: json["moduleName"],
//         webPermissions: json["webPermissions"],
//         mobileAppPermissions: json["mobileAppPermissions"],
//         controllerName: json["controllerName"],
//         actionName: actionNameValues.map[json["actionName"]]!,
//         displayName: json["displayName"],
//         companyName: json["companyName"],
//         isAllowed: json["isAllowed"],
//         isAllowedForMobileApp: json["isAllowedForMobileApp"],
//         isDisplayInLeftMenu: json["isDisplayInLeftMenu"],
//         isDisplayInMobileMenu: json["isDisplayInMobileMenu"],
//         icon: json["icon"],
//         mobileAppIcon: json["mobileAppIcon"],
//         orderNo: json["orderNo"],
//         totalRecords: json["totalRecords"],
//         isAdministrationModule: json["isAdministrationModule"],
//         webPermissionsList: json["webPermissionsList"],
//         mobilePermissionsList: json["mobilePermissionsList"],
//         isLoadingEditButton: json["isLoadingEditButton"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "roleId": roleId,
//         "roleName": roleNameValues.reverse[roleName],
//         "moduleId": moduleId,
//         "moduleName": moduleName,
//         "webPermissions": webPermissions,
//         "mobileAppPermissions": mobileAppPermissions,
//         "controllerName": controllerName,
//         "actionName": actionNameValues.reverse[actionName],
//         "displayName": displayName,
//         "companyName": companyName,
//         "isAllowed": isAllowed,
//         "isAllowedForMobileApp": isAllowedForMobileApp,
//         "isDisplayInLeftMenu": isDisplayInLeftMenu,
//         "isDisplayInMobileMenu": isDisplayInMobileMenu,
//         "icon": icon,
//         "mobileAppIcon": mobileAppIcon,
//         "orderNo": orderNo,
//         "totalRecords": totalRecords,
//         "isAdministrationModule": isAdministrationModule,
//         "webPermissionsList": webPermissionsList,
//         "mobilePermissionsList": mobilePermissionsList,
//         "isLoadingEditButton": isLoadingEditButton,
//       };
// }
//
// enum ActionName { INDEX }
//
// final actionNameValues = EnumValues({"Index": ActionName.INDEX});
//
// enum RoleName { ADMIN }
//
// final roleNameValues = EnumValues({"Admin": RoleName.ADMIN});
//
// class EnumValues<T> {
//   Map<String, T> map;
//   late Map<T, String> reverseMap;
//
//   EnumValues(this.map);
//
//   Map<T, String> get reverse {
//     reverseMap = map.map((k, v) => MapEntry(v, k));
//     return reverseMap;
//   }
// }


// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

LoginModel welcomeFromJson(String str) => LoginModel.fromJson(json.decode(str));

String welcomeToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  final Data data;
  final String message;
  final int status;

  LoginModel({
    required this.data,
    required this.message,
    required this.status,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    data: Data.fromJson(json["data"]),
    message: json["message"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "data": data.toJson(),
    "message": message,
    "status": status,
  };
}

class Data {
  final int id;
  final String email;
  final String accessToken;
  final String refreshToken;
  final String firstName;
  final String lastName;
  final String phone;
  final int roleId;
  final String companyName;
  final int companyId;
  final dynamic externalId;
  final String imageUrl;
  final DateTime dateofBirth;
  final dynamic gender;
  final List<UserPermissionList> userPermissionList;
  final String localTimeZone;
  final String dateFormat;
  final bool isSwitchedAccount;
  final int switchedByUserId;
  final int switchedByRoleId;
  final int switchedByCompanyId;
  final bool isPhoneVerified;

  Data({
    required this.id,
    required this.email,
    required this.accessToken,
    required this.refreshToken,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.roleId,
    required this.companyName,
    required this.companyId,
    required this.externalId,
    required this.imageUrl,
    required this.dateofBirth,
    required this.gender,
    required this.userPermissionList,
    required this.localTimeZone,
    required this.dateFormat,
    required this.isSwitchedAccount,
    required this.switchedByUserId,
    required this.switchedByRoleId,
    required this.switchedByCompanyId,
    required this.isPhoneVerified,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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
    dateofBirth: DateTime.parse(json["dateofBirth"]),
    gender: json["gender"],
    userPermissionList: List<UserPermissionList>.from(json["userPermissionList"].map((x) => UserPermissionList.fromJson(x))),
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
    "dateofBirth": dateofBirth.toIso8601String(),
    "gender": gender,
    "userPermissionList": List<dynamic>.from(userPermissionList.map((x) => x.toJson())),
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
  final int roleId;
  final RoleName roleName;
  final int moduleId;
  final String moduleName;
  final String webPermissions;
  final dynamic mobileAppPermissions;
  final String controllerName;
  final ActionName actionName;
  final String displayName;
  final dynamic companyName;
  final bool isAllowed;
  final bool isAllowedForMobileApp;
  final bool isDisplayInLeftMenu;
  final bool isDisplayInMobileMenu;
  final String icon;
  final String mobileAppIcon;
  final int orderNo;
  final int totalRecords;
  final bool isAdministrationModule;
  final dynamic webPermissionsList;
  final dynamic mobilePermissionsList;
  final bool isLoadingEditButton;

  UserPermissionList({
    required this.roleId,
    required this.roleName,
    required this.moduleId,
    required this.moduleName,
    required this.webPermissions,
    required this.mobileAppPermissions,
    required this.controllerName,
    required this.actionName,
    required this.displayName,
    required this.companyName,
    required this.isAllowed,
    required this.isAllowedForMobileApp,
    required this.isDisplayInLeftMenu,
    required this.isDisplayInMobileMenu,
    required this.icon,
    required this.mobileAppIcon,
    required this.orderNo,
    required this.totalRecords,
    required this.isAdministrationModule,
    required this.webPermissionsList,
    required this.mobilePermissionsList,
    required this.isLoadingEditButton,
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
  PILOT_RENTER
}

final roleNameValues = EnumValues({
  "Pilot (Renter)": RoleName.PILOT_RENTER
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
