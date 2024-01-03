import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({Key? key, required this.name, required this.profession})
      : super(key: key);
  final String name, profession;
  @override
  Widget build(BuildContext context) {
    return const ListTile(
      leading: CircleAvatar(
        backgroundColor: Color(0xFF224907),
      ),
    );
  }
}
