import 'package:dio/dio.dart';
import 'package:rickandmorty/models/characters_model.dart';

class ApiServices {
  //api isteklerimizi burada oluşturucaz
  final _dio = Dio(
    //dio dan nesne oluşturdum _ sembolü private sağladı. Bu nesneyi kullanarak  isteklerimizi yapabiliriz
    BaseOptions(
      // bunun sayesinde dionun ayarlarına erişebiliyorsunuz
      baseUrl:
          'https://rickandmortyapi.com/api', //sadece sonu farklı diye bu kısmını base olarak aldık
    ),
  );

  Future<CharactersModel> getCharacters() async {
    //ben bu methodu çağırdığım zaman geriye charactersmodel isminde bir veri döndürecek. Bende bu model üzerinden verilere kolaylıkla erişebilicem
    try {
      final response = await _dio.get('/character');
      return CharactersModel.fromJson(response.data);
    } catch (e) {
      rethrow;
    }
  }
}
