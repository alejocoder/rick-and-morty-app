// To parse this JSON data, do
//
//     final characterResponse = characterResponseFromJson(jsonString);

import 'dart:convert';

class CharacterResponse {
  CharacterResponse({
    required this.info,
    required this.results,
  });

  Info info;
  List<Character> results;

  factory CharacterResponse.fromRawJson(String str) =>
      CharacterResponse.fromJson(json.decode(str));

  factory CharacterResponse.fromJson(Map<String, dynamic> json) =>
      CharacterResponse(
        info: Info.fromJson(json["info"]),
        results: List<Character>.from(
            json["results"].map((x) => Character.fromJson(x))),
      );
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

  factory Info.fromJson(Map<String, dynamic> json) => Info(
        count: json["count"],
        pages: json["pages"],
        next: json["next"],
        prev: json["prev"],
      );
}

class Character {
  Character({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.episode,
    required this.url,
    required this.created,
  });

  int id;
  String name;
  Status status;
  Species species;
  String type;
  Gender gender;
  Location origin;
  Location location;
  String image;
  List<String> episode;
  String url;
  DateTime created;

  factory Character.fromRawJson(String str) =>
      Character.fromJson(json.decode(str));

  factory Character.fromJson(Map<String, dynamic> json) => Character(
        id: json["id"],
        name: json["name"],
        status: statusValues.map[json["status"]]!,
        species: speciesValues.map[json["species"]]!,
        type: json["type"],
        gender: genderValues.map[json["gender"]]!,
        origin: Location.fromJson(json["origin"]),
        location: Location.fromJson(json["location"]),
        image: json["image"],
        episode: List<String>.from(json["episode"].map((x) => x)),
        url: json["url"],
        created: DateTime.parse(json["created"]),
      );
}

enum Gender { MALE, FEMALE, UNKNOWN }

final genderValues = EnumValues(
    {"Female": Gender.FEMALE, "Male": Gender.MALE, "unknown": Gender.UNKNOWN});

class Location {
  Location({
    required this.name,
    required this.url,
  });

  String name;
  String url;

  factory Location.fromRawJson(String str) =>
      Location.fromJson(json.decode(str));

  factory Location.fromJson(Map<String, dynamic> json) => Location(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };
}

enum Species { HUMAN, ALIEN }

final speciesValues =
    EnumValues({"Alien": Species.ALIEN, "Human": Species.HUMAN});

enum Status { ALIVE, UNKNOWN, DEAD }

final statusValues = EnumValues(
    {"Alive": Status.ALIVE, "Dead": Status.DEAD, "unknown": Status.UNKNOWN});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
