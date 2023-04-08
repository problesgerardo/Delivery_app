// To parse this JSON data, do
//
//     final getUserDataBodyParameters = getUserDataBodyParametersFromJson(jsonString);

import 'dart:convert';

class GetUserDataBodyParameters {
    GetUserDataBodyParameters({
       required this.idToken,
    });

    String idToken;

    factory GetUserDataBodyParameters.fromRawJson(String str) => GetUserDataBodyParameters.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory GetUserDataBodyParameters.fromJson(Map<String, dynamic> json) => GetUserDataBodyParameters(
        idToken: json["idToken"],
    );

    Map<String, dynamic> toJson() => {
        "idToken": idToken,
    };
}