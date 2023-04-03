

import 'dart:convert';

class UserEntity {

  UserEntity({
    this.localId,
    this.role,
    this.userName,
    this.email,
    this.phone,
    this.dateOfBirth,
    this.startDate,
    this.photo,
    this.shippingAddress,
    this.billingAddress,
    this.IdToken,
  });

  String? localId;
  String? role;
  String? userName;
  String? email;
  String? phone;
  String? dateOfBirth;
  String? startDate;
  String? photo;
  String? shippingAddress;
  String? billingAddress;
  String? IdToken;

  factory UserEntity.fromRawJson(String str) => UserEntity.fromJson(json.decode(str));

  String fromRawJson() => json.encode(toJson());

  factory UserEntity.fromJson(Map<String, dynamic> json) => UserEntity(
    localId: json["localId"] == null ? null : json["localId"],
    role: json["role"] == null ? null : json["role"],
    userName: json["userName"] == null ? null : json["userName"],
    email: json["email"] == null ? null : json["email"],
    phone: json["phone"] == null ? null : json["phone"],
    dateOfBirth: json["dateOfBirth"] == null ? null : json["dateOfBirth"],
    startDate: json["startDate"] == null ? null : json["startDate"],
    photo: json["photo"] == null ? null : json["photo"],
    shippingAddress: json["shippingAddress"] == null ? null : json["shippingAddress"],
    billingAddress: json["billingAddress"] == null ? null : json["billingAddress"],
    IdToken: json["IdToken"] == null ? null : json["IdToken"],
  );

  Map<String, dynamic> toJson() => {
    "localId": localId,
    "role" : role,
    "userName": userName,
    "email" : email,
    "phone" : phone,
    "dateOfBirth" : dateOfBirth,
    "startDate": startDate,
    "photo" : photo,
    "shippingAddress": shippingAddress,
    "billingAddress" : billingAddress,
    "IdToken" : IdToken,
  };

}

enum UserRole {
  user, owner, admin, rider
}

extension ParseToString on UserRole {
  String toShortString() {
    return toString().split('.').last;
  }
}

