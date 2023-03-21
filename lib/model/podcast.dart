import 'dart:convert';

PodcastModel podcastModelFromJson(String str) =>
    PodcastModel.fromJson(json.decode(str));

String podcastModelToJson(PodcastModel data) => json.encode(data.toJson());

class PodcastModel {
  PodcastModel({
    required this.name,
    required this.cover,
    required this.title,
    required this.userList,
    required this.desc,
    required this.userName,
    required this.time,
    required this.sTitle,
    required this.id,
    required this.color,
    required this.url,
    required this.cover2,
  });

  String name;
  String cover;
  String title;
  List<UserList> userList;
  String desc;
  String userName;
  String sTitle;
  String color;
  int time;
  int id;
  String url;
  String cover2;

  factory PodcastModel.fromJson(Map<String, dynamic> json) => PodcastModel(
        name: json["name"],
        cover: json["cover"],
        title: json["title"],
        userList: List<UserList>.from(
            json["userList"].map((x) => UserList.fromJson(x))),
        desc: json["desc"],
        userName: json["userName"],
        time: json["time"],
        sTitle: json["sTitle"],
        id: json["id"],
        color: json["color"],
        url: json["url"],
        cover2: json["cover2"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "cover": cover,
        "title": title,
        "userList": List<dynamic>.from(userList.map((x) => x.toJson())),
        "desc": desc,
        "userName": userName,
        "time": time,
        "sTitle": sTitle,
        "id": id,
        "color": color,
        "url": url,
        "cover2": cover2,
      };
}

class UserList {
  UserList({
    required this.name,
    required this.img,
  });

  String name;
  String img;

  factory UserList.fromJson(Map<String, dynamic> json) => UserList(
        name: json["name"],
        img: json["img"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "img": img,
      };
}
