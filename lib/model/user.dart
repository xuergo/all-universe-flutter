import 'dart:convert';

UserInfo UserInfoFromJson(String str) => UserInfo.fromJson(json.decode(str));

String UserInfoToJson(UserInfo data) => json.encode(data.toJson());

class UserInfo {
  UserInfo({
    this.img,
    this.name,
    this.token,
  });

  final String? img;
  final String? name;
  final String? token;

  factory UserInfo.fromJson(Map<String, dynamic> json) => UserInfo(
        img: json["img"],
        name: json["name"],
        token: json["token"],
      );

  Map<String, dynamic> toJson() => {
        "img": img,
        "name": name,
        "token": token,
      };
}
