// To parse this JSON data, do
//
//     final home = homeFromJson(jsonString);

import 'dart:convert';

List<Home> homeFromJson(String str) =>
    List<Home>.from(json.decode(str).map((x) => Home.fromJson(x)));

String homeToJson(List<Home> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Home {
  Home({
    required this.estType,
    required this.estRating,
    required this.estImage,
    required this.estLocation,
    required this.estDescription,
    required this.estTimestamp,
    required this.estPrice,
    required this.estRooms,
    required this.estFloor,
    required this.estStatus,
    required this.isFavorited,
    required this.id,
  });

  String estType;
  int estRating;
  String estImage;
  String estLocation;
  String estDescription;
  DateTime estTimestamp;
  String estPrice;
  int estRooms;
  int estFloor;
  String estStatus;
  bool isFavorited;
  String id;

  factory Home.fromJson(Map<String, dynamic> json) => Home(
        estType: json["est_type"],
        estRating: json["est_rating"],
        estImage: json["est_image"],
        estLocation: json["est_location"],
        estDescription: json["est_description"],
        estTimestamp: DateTime.parse(json["est_timestamp"]),
        estPrice: json["est_price"],
        estRooms: json["est_rooms"],
        estFloor: json["est_floor"],
        estStatus: json["est_status"],
        isFavorited: json["is_favorited"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "est_type": estType,
        "est_rating": estRating,
        "est_image": estImage,
        "est_location": estLocation,
        "est_description": estDescription,
        "est_timestamp": estTimestamp.toIso8601String(),
        "est_price": estPrice,
        "est_rooms": estRooms,
        "est_floor": estFloor,
        "est_status": estStatus,
        "is_favorited": isFavorited,
        "id": id,
      };
}
