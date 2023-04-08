
import 'dart:convert';

class UpdatePasswordBodyParameters {
  UpdatePasswordBodyParameters({
    this.requestType,
    this.email,
  });

  String? requestType;
  String? email;

  factory UpdatePasswordBodyParameters.fromRawJson(String str) => UpdatePasswordBodyParameters.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory UpdatePasswordBodyParameters.fromJson(Map<String, dynamic> json) => UpdatePasswordBodyParameters(
    requestType: json["requestType"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "requestType": requestType,
    "email": email,
  };
}