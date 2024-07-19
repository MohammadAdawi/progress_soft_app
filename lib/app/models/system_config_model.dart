import 'dart:convert';

class SystemConfig {
    String countryCode;
    String incorrectPasswordMessage;
    String mobileRegex;
    String passwordRegex;

    SystemConfig({
        required this.countryCode,
        required this.incorrectPasswordMessage,
        required this.mobileRegex,
        required this.passwordRegex,
    });

    factory SystemConfig.fromRawJson(String str) => SystemConfig.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory SystemConfig.fromJson(Map<String, dynamic> json) => SystemConfig(
        countryCode: json["countryCode"],
        incorrectPasswordMessage: json["incorrectPasswordMessage"],
        mobileRegex: json["mobileRegex"],
        passwordRegex: json["passwordRegex"],
    );

    Map<String, dynamic> toJson() => {
        "countryCode": countryCode,
        "incorrectPasswordMessage": incorrectPasswordMessage,
        "mobileRegex": mobileRegex,
        "passwordRegex": passwordRegex,
    };
}
