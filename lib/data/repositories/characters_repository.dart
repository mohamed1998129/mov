import 'package:mov/data/models/character.dart';
import 'package:mov/data/web_sevices/characters_api.dart';

class CharacterRepository{
  final CharactersApi charactersApi;

  CharacterRepository(this.charactersApi);

  Future<List<Character>> getAllCharacter() async{

    final characters = await charactersApi.getAllCharacter();

    return characters.map((characters) => Character.fromJson(characters)).toList();



  }
}