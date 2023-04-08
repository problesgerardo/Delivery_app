// To parse this JSON data, do
//
//     final userAuthDataDecodable = userAuthDataDecodableFromJson(jsonString);

import 'dart:convert';

class UserAuthDataDecodable {
    UserAuthDataDecodable({
        this.users,
    });

    List<User>? users;

    factory UserAuthDataDecodable.fromRawJson(String str) => UserAuthDataDecodable.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory UserAuthDataDecodable.fromJson(Map<String, dynamic> json) => UserAuthDataDecodable(
        users: json["users"] == null ? [] : List<User>.from(json["users"]!.map((x) => User.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "users": users == null ? [] : List<dynamic>.from(users!.map((x) => x.toJson())),
    };
}

class User {
    User({
        this.localId,
        this.email,
        this.emailVerified,
        this.displayName,
        this.providerUserInfo,
        this.photoUrl,
        this.passwordHash,
        this.passwordUpdatedAt,
        this.validSince,
        this.disabled,
        this.lastLoginAt,
        this.createdAt,
        this.customAuth,
    });

    String? localId;
    String? email;
    bool? emailVerified;
    String? displayName;
    List<ProviderUserInfo>? providerUserInfo;
    String? photoUrl;
    String? passwordHash;
    int? passwordUpdatedAt;
    String? validSince;
    bool? disabled;
    String? lastLoginAt;
    String? createdAt;
    bool? customAuth;

    factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory User.fromJson(Map<String, dynamic> json) => User(
        localId: json["localId"],
        email: json["email"],
        emailVerified: json["emailVerified"],
        displayName: json["displayName"],
        providerUserInfo: json["providerUserInfo"] == null ? [] : List<ProviderUserInfo>.from(json["providerUserInfo"]!.map((x) => ProviderUserInfo.fromJson(x))),
        photoUrl: json["photoUrl"],
        passwordHash: json["passwordHash"],
        passwordUpdatedAt: json["passwordUpdatedAt"],
        validSince: json["validSince"],
        disabled: json["disabled"],
        lastLoginAt: json["lastLoginAt"],
        createdAt: json["createdAt"],
        customAuth: json["customAuth"],
    );

    Map<String, dynamic> toJson() => {
        "localId": localId,
        "email": email,
        "emailVerified": emailVerified,
        "displayName": displayName,
        "providerUserInfo": providerUserInfo == null ? [] : List<dynamic>.from(providerUserInfo!.map((x) => x.toJson())),
        "photoUrl": photoUrl,
        "passwordHash": passwordHash,
        "passwordUpdatedAt": passwordUpdatedAt,
        "validSince": validSince,
        "disabled": disabled,
        "lastLoginAt": lastLoginAt,
        "createdAt": createdAt,
        "customAuth": customAuth,
    };
}

class ProviderUserInfo {
    ProviderUserInfo({
        this.providerId,
        this.displayName,
        this.photoUrl,
        this.federatedId,
        this.email,
        this.rawId,
        this.screenName,
    });

    String? providerId;
    String? displayName;
    String? photoUrl;
    String? federatedId;
    String? email;
    String? rawId;
    String? screenName;

    factory ProviderUserInfo.fromRawJson(String str) => ProviderUserInfo.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory ProviderUserInfo.fromJson(Map<String, dynamic> json) => ProviderUserInfo(
        providerId: json["providerId"],
        displayName: json["displayName"],
        photoUrl: json["photoUrl"],
        federatedId: json["federatedId"],
        email: json["email"],
        rawId: json["rawId"],
        screenName: json["screenName"],
    );

    Map<String, dynamic> toJson() => {
        "providerId": providerId,
        "displayName": displayName,
        "photoUrl": photoUrl,
        "federatedId": federatedId,
        "email": email,
        "rawId": rawId,
        "screenName": screenName,
    };
}
