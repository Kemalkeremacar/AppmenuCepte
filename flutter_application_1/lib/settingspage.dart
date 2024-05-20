import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _isDarkModeEnabled = false;
  String _selectedLanguage = 'Türkçe'; // varsayılan olarak Türkçe seçili

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          // Dark mode switch butonu
          SwitchListTile(
            title: Text('Dark Mode'),
            value: _isDarkModeEnabled,
            onChanged: (value) {
              setState(() {
                _isDarkModeEnabled = value;
              });
              // Burada, _isDarkModeEnabled değişkeninin değerine göre
              // temayı güncellemek için bir işlevi çağırabilirsiniz.
            },
          ),
          // Dil seçimi
          ListTile(
            title: Text('Dil Seçimi'),
            trailing: DropdownButton<String>(
              value: _selectedLanguage,
              onChanged: (String? newValue) {
                setState(() {
                  if (newValue != null) {
                    _selectedLanguage = newValue;
                  }
                });
                // Seçilen dil değiştiğinde yapılacak işlemleri burada gerçekleştirin.
              },
              items: <String>['Türkçe', 'İngilizce']
                  .map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
            ),
          ),
          // Uygulama hakkında
          ListTile(
            title: Text('Uygulama Hakkında'),
            onTap: () {
              _showAboutDialog(context);
            },
          ),
        ],
      ),
    );
  }
  void _showAboutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Uygulama Hakkında'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Kemal Kerem Acar'),
              Text('Kürşat Şimşir'),
              Text('Ahmet Enes Yensiz'),
            ],
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Kapat'),
            ),
          ],
        );
      },
    );
  }
}
