import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mov/bussiness_logic/cubit/characters_cubit.dart';
import 'package:mov/data/repositories/characters_repository.dart';
import 'package:mov/data/web_sevices/characters_api.dart';
import 'package:mov/presentaion/screens/character_details_screen.dart';
import 'package:mov/presentaion/screens/character_screen.dart';
import 'constance/strings.dart';

class AppRouter{

  late CharacterRepository characterRepository;
  late CharactersCubit charactersCubit;

  AppRouter(){
    characterRepository = CharacterRepository(CharactersApi());
    charactersCubit = CharactersCubit(characterRepository);
  }



  Route? generateRoute(RouteSettings settings){
    switch(settings.name){
      case charactersScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
              create: (BuildContext context) => CharactersCubit(characterRepository),
              child:  CharacterScreen(),
        ));
      case characterDetailsScreen:
        return MaterialPageRoute(builder: (_) => const CharacterDetailsScreen());
    }
  }
}
