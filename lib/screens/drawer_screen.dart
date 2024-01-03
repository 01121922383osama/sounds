

import 'package:flutter/material.dart';

import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';

import 'add_occation.dart';
import 'menu_screen.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({Key? key}) : super(key: key);

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  final zoomDrawerController = ZoomDrawerController();
  @override
  Widget build(BuildContext context) {
    return ZoomDrawer(

      controller: zoomDrawerController,
      menuBackgroundColor: Colors.white,
      menuScreen:const Menu(),
      mainScreen: const AddOccation(),

    );
  }
}
