// To parse this JSON data, do
//
//     final episodesResponse = episodesResponseFromJson(jsonString);

import 'dart:convert';

class EpisodesResponse {
  EpisodesResponse({
    required this.results,
  });

  List<Episode> results;

  factory EpisodesResponse.fromRawJson(String str) =>
      EpisodesResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory EpisodesResponse.fromJson(Map<String, dynamic> json) =>
      EpisodesResponse(
        results:
            List<Episode>.from(json["results"].map((x) => Episode.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
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
