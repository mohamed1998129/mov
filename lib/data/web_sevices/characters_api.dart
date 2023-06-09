import 'package:dio/dio.dart';
import 'package:mov/constance/strings.dart';
import 'package:mov/data/models/character.dart';

class CharactersApi{
  Dio? dio;

  CharactersApi(){
    BaseOptions options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      // connectTimeout: 20*1000,//20second
      // receiveTimeout: 20*1000,
    );
    dio = Dio(options);
  }
  Future<List<dynamic>> getAllCharacter() async{
    try{
      Response response = await dio!.get('character');
      return response.data;
    }
    catch(e){
      print(e.toString());
      return [];
    }

}

}