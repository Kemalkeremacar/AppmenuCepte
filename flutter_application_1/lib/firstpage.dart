import 'package:flutter/material.dart';
import 'package:flutter_application_1/secondpage.dart';
import 'package:flutter_application_1/secondpage1.dart';
import 'package:flutter_application_1/thirdpage.dart';
import 'package:google_fonts/google_fonts.dart';


class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          // Gri arka plan
          Positioned.fill(
            child: Container(
              color: Colors.grey[200],
            ),
          ),
          // Üstteki resim
          Positioned(
            top: -80.0,
            left: MediaQuery.of(context).size.width / 2 - 200, // Resmin sol kenarının uygulamanın ortasına gelmesi için hesaplama
            child: ClipRRect(
              borderRadius: BorderRadius.circular(150.0),
              child: Container(
                width: 400.0, // Boyutunun 2 katına çıkması için genişlik 400
                height: 400.0, // Boyutunun 2 katına çıkması için yükseklik 400
                child: Image.asset(
                  'assets/bodyfoto.png',
                  fit: BoxFit.cover, // Resmin tüm alanı kaplaması için BoxFit.cover
                ),
              ),
            ),
          ),
          // "MENUCEPTE" metni
          Positioned(
            top: MediaQuery.of(context).size.height / 2 - 220, // Ekranın ortasına gelmesi için hesaplama
            left: MediaQuery.of(context).size.width / 2 - 145, // Ekranın ortasına gelmesi için hesaplama
            child: Text(
              'MENUCEPTE',
              style: GoogleFonts.montserrat(
                textStyle: Theme.of(context).textTheme.displayLarge,
                fontSize: 45,
                color: Colors.red,
                fontWeight: FontWeight.w700,
                fontStyle: FontStyle.normal,
              ),
            ),
          ),

          Positioned(
            top: MediaQuery.of(context).size.height / 2 - 160, // Ekranın ortasına gelmesi için hesaplama
            left: MediaQuery.of(context).size.width / 2 - 102, // Ekranın ortasına gelmesi için hesaplama
            child: Text(
              'MENU QR CODE APP',
              style: GoogleFonts.montserrat(
                textStyle: Theme.of(context).textTheme.displayLarge,
                fontSize: 21,
                color: Colors.red,
                fontWeight: FontWeight.w400,
                fontStyle: FontStyle.normal,
              ),
            ),
          ),

          // Alt kırmızı bölüm
          Positioned(
            top: 380,
            left: 30,
            child: Container(
              width: 350, // Genişlik
              height: 150, // Yükseklik
              decoration: BoxDecoration(
                color: Colors.red, // Arka plan rengi
                borderRadius: BorderRadius.circular(20), // Köşeleri yuvarlama
              ),
              // İçerik buraya eklenebilir
            ),
          ),

          // Butonlar
          Positioned(
            top: (MediaQuery.of(context).size.height / 2),
            left: (MediaQuery.of(context).size.width / 2) - 85,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => QRViewExample()),
                    );
                  },
                  child: Text('MENU EKLE'),
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SecondPage1()),
                    );
                  },
                  child: Text('MENU GÖRÜNTÜLE'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

