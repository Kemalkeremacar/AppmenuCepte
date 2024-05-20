class Restaurant {
  final String name;
  final double rating;
  final String cuisine;
  final String link;
  final String logo;

  Restaurant({
    required this.name,
    required this.rating,
    required this.cuisine,
    required this.link,
    required this.logo,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      name: json['name'],
      rating: (json['rating'] as num).toDouble(),
      cuisine: json['cuisine'],
      link: json['link'],
      logo: json['logo'],
    );
  }
}

class Ilce {
  final String ilce;
  final List<Restaurant> restaurants;

  Ilce({required this.ilce, required this.restaurants});

  factory Ilce.fromJson(Map<String, dynamic> json) {
    var list = json['restaurants'] as List;
    List<Restaurant> restaurantList = list.map((i) => Restaurant.fromJson(i)).toList();

    return Ilce(
      ilce: json['ilce'],
      restaurants: restaurantList,
    );
  }
}

class Sehir {
  final String sehir;
  final List<Ilce> ilceler;

  Sehir({required this.sehir, required this.ilceler});

  factory Sehir.fromJson(Map<String, dynamic> json) {
    var list = json['ilceler'] as List;
    List<Ilce> ilceList = list.map((i) => Ilce.fromJson(i)).toList();

    return Sehir(
      sehir: json['sehir'],
      ilceler: ilceList,
    );
  }
}

class SehirListesi {
  final List<Sehir> sehirler;

  SehirListesi({required this.sehirler});

  factory SehirListesi.fromJson(Map<String, dynamic> json) {
    var list = json['sehirler'] as List;
    List<Sehir> sehirList = list.map((i) => Sehir.fromJson(i)).toList();

    return SehirListesi(
      sehirler: sehirList,
    );
  }
}
