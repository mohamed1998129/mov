import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mov/presentaion/screens/character_details_screen.dart';
import 'package:mov/presentaion/screens/character_screen.dart';

import 'constance/strings.dart';

class AppRouter{
  Route? generateRoute(RouteSettings settings){
    switch(settings.name){
      case charactersScreen:
        return MaterialPageRoute(builder: (_) => const CharacterScreen());
      case characterDetailsScreen:
        return MaterialPageRoute(builder: (_) => const CharacterDetailsScreen());
    }
  }
}
