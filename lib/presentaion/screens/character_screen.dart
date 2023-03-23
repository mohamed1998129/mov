import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mov/bussiness_logic/cubit/characters_cubit.dart';
import 'package:mov/constance/colors.dart';

import '../../data/models/character.dart';
import '../widgets/CharacterItem.dart';

class CharacterScreen extends StatefulWidget {
  const CharacterScreen({Key? key}) : super(key: key);

  @override
  State<CharacterScreen> createState() => _CharacterScreenState();
}

class _CharacterScreenState extends State<CharacterScreen> {


  late List<Character> allCharacter;

  @override
  void initState() {
    super.initState();
    allCharacter = BlocProvider.of<CharactersCubit>(context).getAllCharacter();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.appYellow,
         title: const Text('Characters', style: TextStyle(color: AppColor.appGray),),
      ),
      body: buildBlocWiget(),
    );
  }

 Widget buildBlocWiget() {
    return BlocBuilder<CharactersCubit,CharactersState>(
        builder: (context,state){
          if(state is CharactersLoaded){
            print('allCharacter[index]'+ state.characters.toString());
            allCharacter = state.characters;
            return BuildLoadedListWidget();
          }
          else{
            return ShowLoadingIndecator();

          }
        },
    );
  }


  Widget BuildLoadedListWidget(){
    return SingleChildScrollView(
      child: Container(
        color: AppColor.appGray,
        child: Column(
          children: [
            buildCharacterList(),
          ],
        ),
      ),
    );
  }

  buildCharacterList(){
    return GridView.builder(
        gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 2/3,
          crossAxisSpacing: 1,
          mainAxisSpacing: 1,
        ),
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        padding: EdgeInsets.zero,
        itemCount: allCharacter.length,
        itemBuilder: (context, index){
          return CharacterItem(character: allCharacter[index],index: index,);
        }
    );
  }

  Widget ShowLoadingIndecator(){
    return Center(
      child: CircularProgressIndicator(
        color: AppColor.appYellow,
      ),
    );
  }

}
