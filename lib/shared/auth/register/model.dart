// To parse this JSON data, do
//
//     final signUpModel = signUpModelFromMap(jsonString);

import 'dart:convert';

SignUpModel signUpModelFromMap(String str) => SignUpModel.fromMap(json.decode(str));

String signUpModelToMap(SignUpModel data) => json.encode(data.toMap());

class SignUpModel {
    String userName;
    String userPassword;
    String displayName;
    String mobileNo;
    String email;
    String civilId;
    String boxno;

    SignUpModel({
        required this.userName,
        required this.userPassword,
        required this.displayName,
        required this.mobileNo,
        required this.email,
        required this.civilId,
        required this.boxno,
    });

    factory SignUpModel.fromMap(Map<String, dynamic> json) => SignUpModel(
        userName: json["USER_NAME"],
        userPassword: json["USER_PASSWORD"],
        displayName: json["DISPLAY_NAME"],
        mobileNo: json["MOBILE_NO"],
        email: json["EMAIL"],
        civilId: json["CIVIL_ID"],
        boxno: json["boxno"],
    );

    Map<String, dynamic> toMap() => {
        "USER_NAME": userName,
        "USER_PASSWORD": userPassword,
        "DISPLAY_NAME": displayName,
        "MOBILE_NO": mobileNo,
        "EMAIL": email,
        "CIVIL_ID": civilId,
        "boxno": boxno,
    };
}
