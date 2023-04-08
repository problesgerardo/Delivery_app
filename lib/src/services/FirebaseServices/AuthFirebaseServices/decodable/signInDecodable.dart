// To parse this JSON data, do
//
//     final signInDecodable = signInDecodableFromJson(jsonString);

import 'dart:convert';

class SignInDecodable {
    SignInDecodable({
        this.kind,
        this.localId,
        this.email,
        this.displayName,
        this.idToken,
        this.registered,
    });

    String? kind;
    String? localId;
    String? email;
    String? displayName;
    String? idToken;
    bool? registered;

    factory SignInDecodable.fromRawJson(String str) => SignInDecodable.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory SignInDecodable.fromJson(Map<String, dynamic> json) => SignInDecodable(
        kind: json["kind"],
        localId: json["localId"],
        email: json["email"],
        displayName: json["displayName"],
        idToken: json["idToken"],
        registered: json["registered"],
    );

    Map<String, dynamic> toJson() => {
        "kind": kind,
        "localId": localId,
        "email": email,
        "displayName": displayName,
        "idToken": idToken,
        "registered": registered,
    };
}
