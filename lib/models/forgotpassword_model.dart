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
