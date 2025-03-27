import 'package:get_it/get_it.dart';
import 'package:rickandmorty/services/api_services.dart';

//bu dosyayı get it paketini kullanmak için oluşturdum

final locator =
    GetIt.instance; //locator ismi yerine getit diyede isimlendirebilridim
//burada get it paketinden bir nesne oluşturduk.bu getit.instance get it in kendisine veriyor (?)
// artık bu locator ı kullanarak bunun içindeki metodlara ulaşabilir olucaz
// bu locatorı kullanmak için yazdığımız servisleri/servis clasımzı kayıt etmemiz lazım

//hepsini alt alta kayıt etmek yerine bir fonksiyon oluştuduk bun içerisine kayıt edicez ve bu fonksiyonu mainde çalıştırıcaz(uygulama ilk açıldığında bu çalışsın)
void setupLocator() {
  locator.registerLazySingleton<ApiServices>(
    () => ApiServices(),
  ); //registerSingleton sürekli olarak aynı nesneyi register.factory ise her seferinde farklı nesneyi döndürürür(üretip döndürüyor galiba?) lazy mantığını biliyon zaten(lazım olunca üretir),() => ise anonim fonksiyon olarak çalışır
}
