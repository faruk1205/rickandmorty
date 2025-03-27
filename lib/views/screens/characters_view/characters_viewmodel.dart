//veri geldiğinde ekranı güncelleme işlemlerini burada yapıyoruz
//aslında state yönetimi yapacağımız yer

import 'package:flutter/material.dart';
import 'package:rickandmorty/app/locator.dart';
import 'package:rickandmorty/models/characters_model.dart';
import 'package:rickandmorty/services/api_services.dart';

//provider ile ilgili bir extend
class CharactersViewModel extends ChangeNotifier {
  //yazacağım fonksiyon apidan alıp viewda göstermemi sağlicak(sayfayı yenilicek). cubit gibi bir şey ama galiba stfull ve stless la alakalı ve provider eklememde bu yüzden araştır!!
  //mvvm mimarisi dedi araştır cubitten farklarıyla !!

  final _apiService =
      locator<
        ApiServices
      >(); //api servisine ulaşmak için bir değişken tanımladık

  CharactersModel?
  _charactersModel; //api servisini vereceği tipi değişken  olarak tanımladık
  CharactersModel? get charactersModel =>
      _charactersModel; //bunun get methodunu yazdık (getter)

  void getCharacters() async {
    _charactersModel =
        await _apiService.getCharacters(); //verimizi aldı değişkene kaydetti
    notifyListeners(); //şimdi ekranı yenilenecek.setstate ile aynı mantıkmış
  }
}
