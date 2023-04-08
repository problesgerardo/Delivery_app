// To parse this JSON data, do
//
//     final getUserDataBodyParameters = getUserDataBodyParametersFromJson(jsonString);

import 'dart:convert';

class GetUserDataUseCaseParameters {
    GetUserDataUseCaseParameters({
      required this.idToken,
    });

    String idToken;

    factory GetUserDataUseCaseParameters.fromRawJson(String str) => GetUserDataUseCaseParameters.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetUserDataUseCaseParameters.fromJson(Map<String, dynamic> json) => GetUserDataUseCaseParameters(
        idToken: json["idToken"],
    );

    Map<String, dynamic> toJson() => {
        "idToken": idToken,
    };
}