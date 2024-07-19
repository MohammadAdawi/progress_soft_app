import 'dart:convert';

class UsersModel {
    List<User> users;

    UsersModel({
        required this.users,
    });

    factory UsersModel.fromRawJson(String str) => UsersModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory UsersModel.fromJson(Map<String, dynamic> json) => UsersModel(
        users: List<User>.from(json["users"].map((x) => User.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "users": List<dynamic>.from(users.map((x) => x.toJson())),
    };
}

class User {
    int age;
    String fullName;
    int gender;
    String password;
    String phoneNumber;

    User({
        required this.age,
        required this.fullName,
        required this.gender,
        required this.password,
        required this.phoneNumber,
    });

    factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory User.fromJson(Map<String, dynamic> json) => User(
        age: json["age"],
        fullName: json["fullName"],
        gender: json["gender"],
        password: json["password"],
        phoneNumber: json["phoneNumber"],
    );

    Map<String, dynamic> toJson() => {
        "age": age,
        "fullName": fullName,
        "gender": gender,
        "password": password,
        "phoneNumber": phoneNumber,
    };
}
