import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
import 'data.dart'; // Model sınıflarının bulunduğu dosya
import 'restaurant_detail_page.dart'; // Restoran detay sayfasının bulunduğu dosya

class SecondPage1 extends StatefulWidget {
  @override
  _SecondPage1State createState() => _SecondPage1State();
}

class _SecondPage1State extends State<SecondPage1> {
  List<Sehir> sehirler = [];
  List<Restaurant> filteredRestaurants = [];
  String selectedCity = '';
  String selectedDistrict = '';
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    loadJsonData();
  }

  Future<void> loadJsonData() async {
    try {
      final String response = await rootBundle.loadString('assets/data.json');
      final data = json.decode(response);
      setState(() {
        sehirler = SehirListesi.fromJson(data).sehirler;
      });
      print("JSON Loaded Successfully: $sehirler");
    } catch (e) {
      print("Error loading JSON: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Restoran Arama'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: TextField(
                    onChanged: (value) {
                      setState(() {
                        searchQuery = value;
                        filteredRestaurants = getFilteredRestaurants();
                      });
                    },
                    decoration: InputDecoration(
                      labelText: 'Restoran Ara',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  flex: 1,
                  child: DropdownButton<String>(
                    isExpanded: true,
                    value: selectedCity.isEmpty ? null : selectedCity,
                    hint: Text('Şehir Seçin'),
                    onChanged: (value) {
                      setState(() {
                        selectedCity = value!;
                        selectedDistrict = '';
                        filteredRestaurants = getFilteredRestaurants();
                      });
                    },
                    items: sehirler.map((Sehir sehir) {
                      return DropdownMenuItem<String>(
                        value: sehir.sehir,
                        child: Text(sehir.sehir),
                      );
                    }).toList(),
                  ),
                ),
                SizedBox(width: 8),
                if (selectedCity.isNotEmpty)
                  Expanded(
                    flex: 1,
                    child: DropdownButton<String>(
                      isExpanded: true,
                      value: selectedDistrict.isEmpty ? null : selectedDistrict,
                      hint: Text('İlçe Seçin'),
                      onChanged: (value) {
                        setState(() {
                          selectedDistrict = value!;
                          filteredRestaurants = getFilteredRestaurants();
                        });
                      },
                      items: sehirler
                          .firstWhere((sehir) => sehir.sehir == selectedCity)
                          .ilceler
                          .map((Ilce ilce) {
                        return DropdownMenuItem<String>(
                          value: ilce.ilce,
                          child: Text(ilce.ilce),
                        );
                      }).toList(),
                    ),
                  ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredRestaurants.length,
              itemBuilder: (context, index) {
                final restaurant = filteredRestaurants[index];
                return Card(
                  margin: EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(restaurant.name),
                    subtitle: Text(restaurant.cuisine),
                    leading: Image.asset(
                      restaurant.logo,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                      errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                        return Icon(Icons.error); // Hata durumunda gösterilecek simge
                      },
                    ),
                    trailing: Icon(Icons.arrow_forward),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => RestaurantDetailPage(restaurant: restaurant),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  List<Restaurant> getFilteredRestaurants() {
    List<Restaurant> restaurants = [];
    if (selectedCity.isNotEmpty) {
      Sehir sehir = sehirler.firstWhere((s) => s.sehir == selectedCity);
      if (selectedDistrict.isNotEmpty) {
        Ilce ilce =
            sehir.ilceler.firstWhere((i) => i.ilce == selectedDistrict);
        restaurants = ilce.restaurants;
      } else {
        sehir.ilceler.forEach((ilce) {
          restaurants.addAll(ilce.restaurants);
        });
      }
    } else {
      sehirler.forEach((sehir) {
        sehir.ilceler.forEach((ilce) {
          restaurants.addAll(ilce.restaurants);
        });
      });
    }

    if (searchQuery.isNotEmpty) {
      restaurants = restaurants
          .where((restaurant) =>
              restaurant.name.toLowerCase().contains(searchQuery.toLowerCase()))
          .toList();
    }

    return restaurants;
  }
}
