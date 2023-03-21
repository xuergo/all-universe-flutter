import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    required this.img,
    required this.name,
  });

  final String img;
  final String name;

  factory User.fromJson(Map<String, dynamic> json) => User(
        img: json["img"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "img": img,
        "name": name,
      };
}
