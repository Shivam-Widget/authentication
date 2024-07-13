class ReservationModel {
  List<ReservationData>? data;
  String? message;
  int? status;
  ReservationModel({this.data, this.message, this.status});
  ReservationModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ReservationData>[];
      if (json['data'] is List) {
        data = (json['data'] as List).map((v) => ReservationData.fromJson(v)).toList();
      }
    }
    message = json['message'];
    status = json['status'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}
class ReservationData {
  int? id;
  String? reservationId;
  String? scheduleTitle;
  String? flightStatus;
  String? startDateTime;
  String? endDateTime;
  String? createdOn;
  String? tailNo;
  String? scheduleActivityName;
  String? companyName;
  String? arrivalAirportName;
  String? departureAirportName;
  int? totalRecords;
  String? member1;
  String? member2;
  String? instructor;
  String? bookedBy;
  int? instructorId;
  String? make;
  String? model;
  String? category;
  int? companyId;
  int? aircraftId;
  int? createdBy;
  int? member1Id;
  int? member2Id;
  bool? isCancelled;
  String? aircraftImage;
  int? flightApprovalStatusId;
  bool? isButtonLoading;
  bool? isAllowToCheckDetails;
  ReservationData(
      {this.id,
        this.reservationId,
        this.scheduleTitle,
        this.flightStatus,
        this.startDateTime,
        this.endDateTime,
        this.createdOn,
        this.tailNo,
        this.scheduleActivityName,
        this.companyName,
        this.arrivalAirportName,
        this.departureAirportName,
        this.totalRecords,
        this.member1,
        this.member2,
        this.instructor,
        this.bookedBy,
        this.instructorId,
        this.make,
        this.model,
        this.category,
        this.companyId,
        this.aircraftId,
        this.createdBy,
        this.member1Id,
        this.member2Id,
        this.isCancelled,
        this.aircraftImage,
        this.flightApprovalStatusId,
        this.isButtonLoading,
        this.isAllowToCheckDetails});
  ReservationData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    reservationId = json['reservationId'];
    scheduleTitle = json['scheduleTitle'];
    flightStatus = json['flightStatus'];
    startDateTime = json['startDateTime'];
    endDateTime = json['endDateTime'];
    createdOn = json['createdOn'];
    tailNo = json['tailNo'];
    scheduleActivityName = json['scheduleActivityName'];
    companyName = json['companyName'];
    arrivalAirportName = json['arrivalAirportName'];
    departureAirportName = json['departureAirportName'];
    totalRecords = json['totalRecords'];
    member1 = json['member1'];
    member2 = json['member2'];
    instructor = json['instructor'];
    bookedBy = json['bookedBy'];
    instructorId = json['instructorId'];
    make = json['make'];
    model = json['model'];
    category = json['category'];
    companyId = json['companyId'];
    aircraftId = json['aircraftId'];
    createdBy = json['createdBy'];
    member1Id = json['member1Id'];
    member2Id = json['member2Id'];
    isCancelled = json['isCancelled'];
    aircraftImage = json['aircraftImage'];
    flightApprovalStatusId = json['flightApprovalStatusId'];
    isButtonLoading = json['isButtonLoading'];
    isAllowToCheckDetails = json['isAllowToCheckDetails'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['reservationId'] = this.reservationId;
    data['scheduleTitle'] = this.scheduleTitle;
    data['flightStatus'] = this.flightStatus;
    data['startDateTime'] = this.startDateTime;
    data['endDateTime'] = this.endDateTime;
    data['createdOn'] = this.createdOn;
    data['tailNo'] = this.tailNo;
    data['scheduleActivityName'] = this.scheduleActivityName;
    data['companyName'] = this.companyName;
    data['arrivalAirportName'] = this.arrivalAirportName;
    data['departureAirportName'] = this.departureAirportName;
    data['totalRecords'] = this.totalRecords;
    data['member1'] = this.member1;
    data['member2'] = this.member2;
    data['instructor'] = this.instructor;
    data['bookedBy'] = this.bookedBy;
    data['instructorId'] = this.instructorId;
    data['make'] = this.make;
    data['model'] = this.model;
    data['category'] = this.category;
    data['companyId'] = this.companyId;
    data['aircraftId'] = this.aircraftId;
    data['createdBy'] = this.createdBy;
    data['member1Id'] = this.member1Id;
    data['member2Id'] = this.member2Id;
    data['isCancelled'] = this.isCancelled;
    data['aircraftImage'] = this.aircraftImage;
    data['flightApprovalStatusId'] = this.flightApprovalStatusId;
    data['isButtonLoading'] = this.isButtonLoading;
    data['isAllowToCheckDetails'] = this.isAllowToCheckDetails;
    return data;
  }
}