// To parse this JSON data, do
//
//     final podcastDetail = podcastDetailFromJson(jsonString);

import 'dart:convert';

PodcastDetail podcastDetailFromJson(String str) =>
    PodcastDetail.fromJson(json.decode(str));

String podcastDetailToJson(PodcastDetail data) => json.encode(data.toJson());

class PodcastDetail {
  PodcastDetail({
    required this.name,
    required this.color,
    required this.cover,
    required this.cover2,
    required this.title,
    required this.userName,
    required this.desc,
    required this.time,
    required this.content,
    required this.url,
    required this.id,
  });

  String name;
  String color;
  String cover;
  String title;
  String userName;
  String desc;
  int time;
  int id;
  String content;
  String cover2;
  String url;

  factory PodcastDetail.fromJson(Map<String, dynamic> json) => PodcastDetail(
        name: json["name"],
        color: json["color"],
        cover: json["cover"],
        title: json["title"],
        userName: json["userName"],
        desc: json["desc"],
        time: json["time"],
        content: json["content"],
        cover2: json["cover2"],
        url: json["url"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "color": color,
        "cover": cover,
        "title": title,
        "userName": userName,
        "desc": desc,
        "time": time,
        "content": content,
        "cover2": cover2,
        "url": url,
        "id": id,
      };
}
