import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_application_1/ustkisim.dart';




class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UstKisim(onBackButtonPressed: () {
          Navigator.of(context).pop();
        },),
      body: MyHomePage(), // MyHomePage burada çağrılıyor
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {
  String _aramaTerimi = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              color: Colors.red,
              child: SizedBox(
                width: double.infinity,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Aradığınız menü ismini yazınız',
                  ),
                  onChanged: (value) {
                    setState(() {
                      _aramaTerimi = value;
                    });
                  },
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: _menuler
                  .where((menu) =>
                      menu.ad.toLowerCase().contains(_aramaTerimi.toLowerCase()))
                  .map((menu) => ListTile(
                        leading: Container(
                          width: 48,
                          height: 48,
                          child: Image.asset("assets/foodicon.png"),
                        ),
                        title: Text(menu.ad),
                        subtitle: Text(menu.mutfak),
                        onTap: () {
                          _showMenuDetail(context, menu);
                        },
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}


void _showMenuDetail(BuildContext context, Menu menu) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(menu.ad),
          content: Text("Bu menüye ait detaylar burada olacak."),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Kapat"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _launchURL(menu.link);
              },
              child: Text("Linki Aç"),
            ),
          ],
        );
      },
    );
  }

  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }


class Menu {
  String ad;
  String mutfak;
  String link; // Link alanı eklendi

  Menu(this.ad, this.mutfak, this.link);
}

List<Menu> _menuler = [
  Menu('Dominos Pizza', 'Fast Food', 'https://www.dominos.com.tr/'),
  Menu('Köfteci Yusuf', 'Köfte', 'https://www.kofteciyusuf.com/'),
  Menu('McDonalds', 'Fast Food', 'https://www.mcdonalds.com/'),
  Menu('Burger King', 'Fast Food', 'https://www.burgerking.com.tr/'),
  Menu('KFC', 'Tavuk', 'https://www.kfcturkiye.com/'),
  Menu('Pizza Hut', 'Pizza', 'https://www.pizzahut.com.tr/'),
];