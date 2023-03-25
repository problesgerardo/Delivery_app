
// To parse this JSON data, do
//
//     final correctPostBodyParams = correctPostBodyParamsFromJson(jsonString);

import 'dart:convert';

class CorrectPostBodyParams {
    CorrectPostBodyParams({
        this.title,
        this.body,
        this.userId,
    });

    String? title;
    String? body;
    int? userId;

    factory CorrectPostBodyParams.fromRawJson(String str) => CorrectPostBodyParams.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CorrectPostBodyParams.fromJson(Map<String, dynamic> json) => CorrectPostBodyParams(
        title: json["title"],
        body: json["body"],
        userId: json["userId"],
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "body": body,
        "userId": userId,
    };
}

// To parse this JSON data, do
//
//     final correctPutBodyParams = correctPutBodyParamsFromJson(jsonString);

class CorrectPutBodyParams {
    CorrectPutBodyParams({
        this.id,
        this.title,
        this.body,
        this.userId,
    });

    int? id;
    String? title;
    String? body;
    int? userId;

    factory CorrectPutBodyParams.fromRawJson(String str) => CorrectPutBodyParams.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory CorrectPutBodyParams.fromJson(Map<String, dynamic> json) => CorrectPutBodyParams(
        id: json["id"],
        title: json["title"],
        body: json["body"],
        userId: json["userId"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "body": body,
        "userId": userId,
    };
}

