import 'dart:convert';

/// 请求返回格式
ResultData resultDataFromJson(String str) =>
    ResultData.fromJson(json.decode(str));

String resultDataToJson(ResultData data) => json.encode(data.toJson());

class ResultData<T> {
  ResultData({
    required this.code,
    this.data,
    this.msg,
  });

  int code;
  String? msg;
  T? data;

  factory ResultData.fromJson(Map<String, dynamic> json) => ResultData(
        code: json["code"],
        msg: json["msg"],
        data: json["data"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "msg": msg,
        "data": data,
      };
}
