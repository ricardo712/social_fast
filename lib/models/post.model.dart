import 'dart:convert';


PostModel userFromJson(String str) => PostModel.fromJson(json.decode(str));

String userToJson(PostModel data) => json.encode(data.toJson());

class PostModel  {
  PostModel(
      {required this.date,
      required this.content,
      required this.userUid,
      required this.name,
      required this.image});
      

  final num date;
  final String image;
  final String userUid;
  final String content;
  final String name;


  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
      date: json["date"],
      image: json["image"],
      content: json["content"],
      userUid: json['userUid'],
      name: json['name']);

  Map<String, dynamic> toJson() => {
        "date": date,
        "content": content,
        "userId": userUid,
        'image': image,
        'name': name,
    
      };
}
