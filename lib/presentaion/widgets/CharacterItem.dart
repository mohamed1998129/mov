import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:mov/constance/colors.dart';

import '../../data/models/character.dart';

class CharacterItem extends StatelessWidget {
  const CharacterItem({Key? key, required this.character, required this.index}) : super(key: key);

  final Character character;
  final index ;



  @override
  Widget build(BuildContext context) {

    return  Container(
      width: double.infinity,
      margin: const EdgeInsetsDirectional.fromSTEB(8, 8, 8, 8),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: AppColor.appWhite,
        borderRadius: BorderRadius.circular(8),
      ),
      child: GridTile(
        footer: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
          color: Colors.black54,
          alignment: Alignment.bottomCenter,
          child: Text('${character.results[index].name}', style: const TextStyle(
            height: 1.3,
            fontSize: 16,
            color: AppColor.appWhite,
            fontWeight: FontWeight.bold
          ),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        ),
        child: Container(
          color: AppColor.appGray,
          child:character.results[index].image.isNotEmpty?
          FadeInImage(
              width: double.infinity,
              height: double.infinity,
              placeholder: const AssetImage("assets/images/loading.gif"),
              image:NetworkImage(character.results[index].image) ,
            fit: BoxFit.cover,
          ) : Image.asset('assets/images/error.png'),
        ),
      ),
    );
  }
}
