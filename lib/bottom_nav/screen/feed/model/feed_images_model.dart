// To parse this JSON data, do
//
//     final getApiImagesModel = getApiImagesModelFromJson(jsonString);

import 'dart:convert';

List<GetApiImagesModel> getApiImagesModelFromJson(String str) => List<GetApiImagesModel>.from(json.decode(str).map((x) => GetApiImagesModel.fromJson(x)));

String getApiImagesModelToJson(List<GetApiImagesModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GetApiImagesModel {
    String id;
    String author;
    int width;
    int height;
    String url;
    String downloadUrl;

    GetApiImagesModel({
        required this.id,
        required this.author,
        required this.width,
        required this.height,
        required this.url,
        required this.downloadUrl,
    });

    factory GetApiImagesModel.fromJson(Map<String, dynamic> json) => GetApiImagesModel(
        id: json["id"],
        author: json["author"],
        width: json["width"],
        height: json["height"],
        url: json["url"],
        downloadUrl: json["download_url"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "author": author,
        "width": width,
        "height": height,
        "url": url,
        "download_url": downloadUrl,
    };
}
