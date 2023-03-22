import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../data/models/character.dart';
import '../../data/repositories/characters_repository.dart';
part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {

  final CharacterRepository characterRepository;
  late List<Character> characters;

  CharactersCubit(this.characterRepository) : super(CharactersInitial());

  List<Character> getAllCharacter(){
    characterRepository.getAllCharacter().then((characters){
      emit(CharactersLoaded(characters));
      this.characters = characters;
    });
    return characters;
  }

}
