import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:test_tecnico_rick_morty/models/characters_response.dart';

class ApiProvider extends ChangeNotifier {
  final String _baseUrl = 'rickandmortyapi.com';

  List<Character> characters = [];

  ApiProvider() {
    print('provider incializado');
    getCharacters();
  }

  getCharacters() async {
    var url = Uri.https(_baseUrl, '/api/character');

    // Await the http get response, then decode the json-formatted response.
    var response = await http.get(url);
    final characterResponse = CharacterResponse.fromRawJson(response.body);
    characters = characterResponse.results;
    notifyListeners();
  }
}
