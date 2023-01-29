import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/characters_response.dart';
import '../models/episodes_response.dart';
import '../models/locations_response.dart';

class ApiProvider extends ChangeNotifier {
  final String _baseUrl = 'rickandmortyapi.com';

  List<Character> characters = [];
  List<Episode> episodes = [];
  List<Locacion> locations = [];

  ApiProvider() {
    getCharacters();
    getEpisodes();
    getLocations();
  }

  getCharacters() async {
    var url = Uri.https(_baseUrl, '/api/character');

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    final characterResponse = CharacterResponse.fromRawJson(response.body);
    characters = characterResponse.results;
    notifyListeners();
  }

  getEpisodes() async {
    var url = Uri.https(_baseUrl, '/api/episode');

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    final episodesResponse = EpisodesResponse.fromRawJson(response.body);
    episodes = episodesResponse.results;
    notifyListeners();
  }

  getLocations() async {
    var url = Uri.https(_baseUrl, '/api/location');

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    final locationsResponse = LocationsResponse.fromRawJson(response.body);
    locations = locationsResponse.results;
    notifyListeners();
  }
}
