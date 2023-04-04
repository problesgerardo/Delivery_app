
import 'dart:convert';

class SignInEntity {

  SignInEntity({
    this.localId,
    this.email,
    this.displayName,
    this.idToken,
    this.registered,
    this.refreshToken,
    this.expiresIn,
  });

    String? localId;
    String? email;
    String? displayName;
    String? idToken;
    bool? registered;
    String? refreshToken;
    String? expiresIn;

  factory SignInEntity.fromRawJson(String str) => SignInEntity.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SignInEntity.fromJson(Map<String, dynamic> json) => SignInEntity(
    localId: json["localId"],
    email: json["email"],
    displayName: json["displayName"],
    idToken: json["idToken"],
    registered: json["registered"],
    refreshToken: json["refreshToken"],
    expiresIn: json["expiresIn"],
  );

  Map<String, dynamic> toJson() => {
    "localId": localId,
    "email": email,
    "displayName": displayName,
    "idToken": idToken,
    "registered": registered,
    "refreshToken": refreshToken,
    "expiresIn": expiresIn,
  };
}