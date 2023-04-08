// To parse this JSON data, do
//
//     final updatePasswordDecodable = updatePasswordDecodableFromJson(jsonString);

import 'dart:convert';

class UpdatePasswordDecodable {
    UpdatePasswordDecodable({
        this.kind,
        this.email,
    });

    String? kind;
    String? email;

    factory UpdatePasswordDecodable.fromRawJson(String str) => UpdatePasswordDecodable.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory UpdatePasswordDecodable.fromJson(Map<String, dynamic> json) => UpdatePasswordDecodable(
        kind: json["kind"],
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "kind": kind,
        "email": email,
    };
}