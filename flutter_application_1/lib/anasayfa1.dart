import 'package:flutter/material.dart';
import 'package:flutter_application_1/firstpage.dart';
import 'package:flutter_application_1/settingspage.dart';
import 'package:flutter_application_1/ustkisim.dart';

class Anasayfa extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa>{
  
  
  int aktifSayfa = 0;

  gecerliSayfa(int sayfa)
  {
    if(sayfa == 0)
    {
      return FirstPage();
    }
    else if(sayfa == 1)
    {
      return SettingsPage();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: UstKisim(),

      body: gecerliSayfa(aktifSayfa),
      

      bottomNavigationBar: new BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: aktifSayfa,
        items : [
          new BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            label: 'Ana Sayfa',
          ),
          new BottomNavigationBarItem(
            icon: new Icon(Icons.settings),
            label: 'Ayarlar',
          ),
        ],
        onTap: (int i){
          aktifSayfa = i;
          setState(() {
          });
        },
      ),
    );
  }
}