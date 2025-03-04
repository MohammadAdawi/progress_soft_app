import 'dart:convert';

class PostsModel {
    int userId;
    int id;
    String title;
    String body;

    PostsModel({
        required this.userId,
        required this.id,
        required this.title,
        required this.body,
    });

    factory PostsModel.fromRawJson(String str) => PostsModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory PostsModel.fromJson(Map<String, dynamic> json) => PostsModel(
        userId: json["userId"],
        id: json["id"],
        title: json["title"],
        body: json["body"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "id": id,
        "title": title,
        "body": body,
    };
}
