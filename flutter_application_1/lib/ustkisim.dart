import 'package:flutter/material.dart';

class UstKisim extends StatelessWidget implements PreferredSizeWidget {
  final bool showBackButton;
  final VoidCallback? onBackButtonPressed;

  const UstKisim({Key? key, this.showBackButton = true, this.onBackButtonPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Center(
        child: Image.asset(
          'assets/appBarfoto.png',
          width: 200,
          height: 200,
          alignment: Alignment.topCenter,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
