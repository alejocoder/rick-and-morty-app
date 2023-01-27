// To parse this JSON data, do
//
//     final episodesResponse = episodesResponseFromJson(jsonString);

import 'dart:convert';

class EpisodesResponse {
  EpisodesResponse({
    required this.info,
    required this.results,
  });

  Info info;
  List<Episode> results;

  factory EpisodesResponse.fromRawJson(String str) =>
      EpisodesResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory EpisodesResponse.fromJson(Map<String, dynamic> json) =>
      EpisodesResponse(
        info: Info.fromJson(json["info"]),
        results:
            List<Episode>.from(json["results"].map((x) => Episode.fromJson(x))),
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

class Episode {
  Episode({
    required this.id,
    required this.name,
    required this.airDate,
    required this.episode,
    required this.characters,
    required this.url,
    required this.created,
  });

  int id;
  String name;
  String airDate;
  String episode;
  List<String> characters;
  String url;
  DateTime created;

  factory Episode.fromRawJson(String str) => Episode.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Episode.fromJson(Map<String, dynamic> json) => Episode(
        id: json["id"],
        name: json["name"],
        airDate: json["air_date"],
        episode: json["episode"],
        characters: List<String>.from(json["characters"].map((x) => x)),
        url: json["url"],
        created: DateTime.parse(json["created"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "air_date": airDate,
        "episode": episode,
        "characters": List<dynamic>.from(characters.map((x) => x)),
        "url": url,
        "created": created.toIso8601String(),
      };
}
