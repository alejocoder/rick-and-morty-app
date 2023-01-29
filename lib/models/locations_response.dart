// To parse this JSON data, do
//
//     final locationsResponse = locationsResponseFromJson(jsonString);

import 'dart:convert';

class LocationsResponse {
  LocationsResponse({
    required this.info,
    required this.results,
  });

  Info info;
  List<Locacion> results;

  factory LocationsResponse.fromRawJson(String str) =>
      LocationsResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LocationsResponse.fromJson(Map<String, dynamic> json) =>
      LocationsResponse(
        info: Info.fromJson(json["info"]),
        results: List<Locacion>.from(
            json["results"].map((x) => Locacion.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "info": info.toJson(),
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };
}

class Info {
  Info({
    required this.count,
    required this.pages,
    required this.next,
    this.prev,
  });

  int count;
  int pages;
  String next;
  dynamic prev;

  factory Info.fromRawJson(String str) => Info.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Info.fromJson(Map<String, dynamic> json) => Info(
        count: json["count"],
        pages: json["pages"],
        next: json["next"],
        prev: json["prev"],
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "pages": pages,
        "next": next,
        "prev": prev,
      };
}

class Locacion {
  Locacion({
    required this.id,
    required this.name,
    required this.type,
    required this.dimension,
    required this.residents,
    required this.url,
    required this.created,
  });

  int id;
  String name;
  String type;
  String dimension;
  List<String> residents;
  String url;
  DateTime created;

  factory Locacion.fromRawJson(String str) =>
      Locacion.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Locacion.fromJson(Map<String, dynamic> json) => Locacion(
        id: json["id"],
        name: json["name"],
        type: json["type"],
        dimension: json["dimension"],
        residents: List<String>.from(json["residents"].map((x) => x)),
        url: json["url"],
        created: DateTime.parse(json["created"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "type": type,
        "dimension": dimension,
        "residents": List<dynamic>.from(residents.map((x) => x)),
        "url": url,
        "created": created.toIso8601String(),
      };
}
