import 'package:flutter/material.dart';

import 'side_menu.dart';

class Menu extends StatefulWidget {
  const Menu({Key? key}) : super(key: key);

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF224907),
      body: SafeArea(
        child: Column(
          children: [
            Image.asset('assets/Images/images.jpg'),
            const SideMenu(),
          ],
        ),
      ),
    );
  }
}
