import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'inside_setting.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 24),
          child: Padding(
            padding: EdgeInsets.only(left: 24),
            child: Divider(
              color: Colors.white24,
              height: 1,
            ),
          ),
        ),
        ListTile(
          onTap: () {},
          leading: SizedBox(
              height: 34,
              width: 34,
              child: Image.asset(
                'assets/Images/3079106.png',
                width: 10,
                height: 5,
                color: Colors.white,
              )),
          title: const Text(
            'السيرة الذاتية للشيخ',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        ListTile(
          onTap: () {
            //Navigator.push(context,MaterialPageRoute(builder: (_) => riveasset()));
          },
          leading: SizedBox(
              height: 34,
              width: 34,
              child: Image.asset(
                'assets/Images/6319801.png',
                width: 10,
                height: 5,
                color: Colors.white,
              )),
          title: const Text(
            'الحسابات الرسمية للشيخ',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        ListTile(
          onTap: () {},
          leading: SizedBox(
              height: 34,
              width: 34,
              child: Image.asset(
                'assets/Images/8103433.png',
                width: 10,
                height: 5,
                color: Colors.white,
              )),
          title: const Text(
            'للتواصل مع المبرمج',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        ListTile(
          onTap: () {},
          leading: const SizedBox(
              height: 34,
              width: 34,
              child: Icon(
                CupertinoIcons.book_circle,
                color: Colors.white,
              )),
          title: const Text(
            'المفضلة',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        ListTile(
          onTap: () {},
          leading: const SizedBox(
              height: 34,
              width: 34,
              child: Icon(
                CupertinoIcons.create,
                color: Colors.white,
              )),
          title: const Text(
            'سياسة الخصوصية',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        ListTile(
          onTap: () {},
          leading: const SizedBox(
              height: 34,
              width: 34,
              child: Icon(
                CupertinoIcons.star,
                color: Colors.white,
              )),
          title: const Text(
            'تقييم التطبيق ',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        ListTile(
          onTap: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (_) => const Settings()));
          },
          leading: const SizedBox(
              height: 34,
              width: 34,
              child: Icon(
                CupertinoIcons.square_fill_on_square_fill,
                color: Colors.white,
              )),
          title: const Text(
            'برامجنا الاخرى',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        ListTile(
          onTap: () {
            //  Navigator.push(context,MaterialPageRoute(builder: (_) => Cancel()));
          },
          leading: const SizedBox(
              height: 34,
              width: 34,
              child: Icon(
                CupertinoIcons.square_arrow_right,
                color: Colors.white,
              )),
          title: const Text(
            'خروج ',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ],
    );
  }
}
