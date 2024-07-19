// set up login model
import 'dart:convert';

TokenLoginModel loginModelFromMap(String str) =>
    TokenLoginModel.fromMap(json.decode(str));

String loginModelToMap(TokenLoginModel data) => json.encode(data.toMap());

class TokenLoginModel {
  String? accessToken;
  String? tokenType;
  int? expiresIn;

  TokenLoginModel({
    required this.accessToken,
    required this.tokenType,
    required this.expiresIn,
  });

  factory TokenLoginModel.fromMap(Map<String?, dynamic> json) =>
      TokenLoginModel(
        accessToken: json["access_token"],
        tokenType: json["token_type"],
        expiresIn: json["expires_in"],
      );

  Map<String?, dynamic> toMap() => {
        "access_token": accessToken,
        "token_type": tokenType,
        "expires_in": expiresIn,
      };
}
