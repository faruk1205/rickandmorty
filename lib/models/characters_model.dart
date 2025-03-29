class CharactersModel {
  //en alttaki yorum satırında bundan bahsediyorum
  final CharacterInfo info;
  final List<CharacterModel> characters;

  CharactersModel({required this.info, required this.characters});

  factory CharactersModel.fromJson(Map<String, dynamic> json) {
    final info = CharacterInfo.fromJson(
      json['info'],
    ); //yani bir üst satırdaki json ın içindeki infoyu CharacterInfo sınıfına veriyoruz o bize characterinfo döndürüp bu satırdaki info içerisine kaydedicek yani bir üst satırdaki json ın içindeki results kısmını karakterlerin listesini oluşturuyoruz
    final characters =
        (json['results'] as List)
            .map((characterJson) => CharacterModel.fromJson(characterJson))
            .toList(); //aynı ama bizim elimizde birtane karakter olmicak bir liste halinde json ın içinde olacağı için bu jsoon ın içerisindeki listeyi map metoduyla characterModel sınıfına dönüştürüyoruz. yani hepsini tek tek döndürücez.en sonda  türü iterable olduğu için bunu .tolist ile listeye çevirdik

    return CharactersModel(
      info: info,
      characters: characters,
    ); //artık modelimizi geriye döndürebilirz
  }
  //bir consructer kendisini döndürüyorsa bu factory oluyor yani bir fabrika
}

class CharacterInfo {
  final int
  count; //final çünkü bu model oluşturuken bu verilerin bize verilmesini isticem
  final int pages; //bunları apı sitesine bakarak yazdık
  final String? next; //sonraki sayfa
  final String? prev; //önceki sayfa

  CharacterInfo({
    required this.count,
    required this.pages,
    required this.next,
    required this.prev,
  });
  //bu info bana json olarak geleceği için json ı bu modele çeviren bir fonksiyon yazmalıyım

  CharacterInfo.fromJson(Map<String, dynamic> json)
    : count = json['count'],
      pages = json['pages'],
      next = json['next'],
      prev = json['prev'];

  // veya
  //factory CharactersInfo.fromJson(Map<String, dynamic> json) => CharactersInfo(
  //   count: json['count'],
  //   pages: json['pages'],
  //   next: json['next'],
  //   prev: json['prev'],
  //);   yapabilirdim
}

class CharacterModel {
  //api daki result(bir liste) kısmından kullanacaklarım için yapıyorum
  final int id;
  final String name;
  final String status;
  final String species;
  final String gender;
  final String image;
  final Origin origin;
  final Location
  location; //Location isminde yeni bir model oluşturup(sonradan),location isminde tanımladıkk
  final List<String>
  episodes; // bu liste olarak geldiği için liste ayptık. veriler string değilde model gibi gelseydi String yerine model ismi gelicekti (yukardakine benziyor

  CharacterModel({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.gender,
    required this.image,
    required this.origin,
    required this.location,
    required this.episodes,
  });

  CharacterModel.fromJson(Map<String, dynamic> json)
    : id = json['id'],
      name = json['name'],
      status = json['status'],
      species = json['species'],
      gender = json['gender'],
      image = json['image'],
      origin = Origin.fromJson(json['origin']),
      location = Location.fromJson(json['location']),
      episodes = List<String>.from(json['episode']);
}

class Location {
  final String name;
  final String url;

  Location({required this.name, required this.url});

  Location.fromJson(Map<String, dynamic> json)
    : name = json['name'],
      url = json['url'];
}

class Origin {
  final String name;
  final String url;

  Origin({required this.name, required this.url});

  Origin.fromJson(Map<String, dynamic> json)
    : name = json['name'],
      url = json['url'];
}
//şimdi bunlar parça parça elimde ama bize tam halinde json olarak gelicek.Biz bu tam json ı o parçalarla birleştirip bir modele çeviricez o yüzden en başa CharacterModels oluşturup hepsini elinde tutmasını sağlıcaz

//bu modelleri api sitesinde verilen get urlsini alıp google da açıp içindeki her şeyi kopyalayp "dart to json" diye google yıp bir sayfada  genereta edip hazır olarak alabilirsin ama istediğin tarza göre düzenlemek gerekebilir ama o haliylede kullanılabilir
