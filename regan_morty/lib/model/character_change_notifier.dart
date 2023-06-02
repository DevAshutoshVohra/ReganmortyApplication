import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'character.dart';
import 'package:dio/dio.dart';

class CharacterChangeNotifier extends ChangeNotifier {
  List<Character> characterlist = [];
  late final response;
  void getCharacterData() async {
    try {
      response = await Dio().get('https://rickandmortyapi.com/api/character');
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }

    for (int i = 0; i < 20; i++) {
      characterlist.add(
        Character(
          image: response.body['results'][i]['image'],
          name: response.body['results'][i]['name'],
          id: response.body['results'][i]['id'].toString(),
        ),
      );
    }

    
    notifyListeners();
  }
}
