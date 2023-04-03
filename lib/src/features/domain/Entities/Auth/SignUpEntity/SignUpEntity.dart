
// To parse this JSON data, do
//
//     final signUpDecodable = signUpDecodableFromJson(jsonString);

import 'dart:convert';

class SignUpEntity {
    SignUpEntity({
        this.kind,
        this.idToken,
        this.email,
        this.refreshToken,
        this.expiresIn,
        this.localId,
    });

    String? kind;
    String? idToken;
    String? email;
    String? refreshToken;
    String? expiresIn;
    String? localId;

    factory SignUpEntity.fromRawJson(String str) => SignUpEntity.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory SignUpEntity.fromJson(Map<String, dynamic> json) => SignUpEntity(
        kind: json["kind"],
        idToken: json["idToken"],
        email: json["email"],
        refreshToken: json["refreshToken"],
        expiresIn: json["expiresIn"],
        localId: json["localId"],
    );

    Map<String, dynamic> toJson() => {
        "kind": kind,
        "idToken": idToken,
        "email": email,
        "refreshToken": refreshToken,
        "expiresIn": expiresIn,
        "localId": localId,
    };
}
