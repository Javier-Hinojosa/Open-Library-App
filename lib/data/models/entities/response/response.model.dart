import 'dart:convert';

ResponseModel responseFromJson(String str) =>
    ResponseModel.fromJson(json.decode(str));

String responseToJson(ResponseModel data) => json.encode(data.toJson());

class ResponseModel {
  ResponseModel({
    this.status,
    this.message,
    this.data,
  });

  int? status;
  String? message;
  String? data;

  factory ResponseModel.fromJson(Map<String, dynamic> json) => ResponseModel(
        status: json["status"],
        message: json["message"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data,
      };
}
