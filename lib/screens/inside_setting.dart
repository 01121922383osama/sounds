import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الاعدادات'),
        backgroundColor: const Color.fromRGBO(143, 148, 251, 2),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Column(
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
            Padding(
              padding: const EdgeInsets.only(left: 225),
              child: ListTile(
                onTap: () {},
                leading: const SizedBox(
                    height: 34,
                    width: 34,
                    child: Padding(
                      padding: EdgeInsets.only(left: 130),
                      child: Icon(
                        CupertinoIcons.person,
                        color: Colors.black,
                      ),
                    )),
                title: const Text(
                  'الحساب',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 18),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 230),
              child: ListTile(
                onTap: () {
                  //Navigator.push(context,MaterialPageRoute(builder: (_) => launguages()));
                },
                leading: const SizedBox(
                    height: 34,
                    width: 34,
                    child: Padding(
                      padding: EdgeInsets.only(left: 130),
                      child: Icon(
                        CupertinoIcons.bold,
                        color: Colors.black,
                      ),
                    )),
                title: const Text(
                  ' اللغات',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 18),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 230),
              child: ListTile(
                onTap: () {
                  // Navigator.push(context,MaterialPageRoute(builder: (_) => apperance()));
                },
                leading: const SizedBox(
                    height: 34,
                    width: 34,
                    child: Padding(
                      padding: EdgeInsets.only(left: 125),
                      child: Icon(
                        CupertinoIcons.color_filter,
                        color: Colors.black,
                      ),
                    )),
                title: const Text(
                  ' المظهر',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 18),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 230),
              child: ListTile(
                onTap: () {
                  // Navigator.push(context,MaterialPageRoute(builder: (_) => apperance()));
                },
                leading: const SizedBox(
                    height: 34,
                    width: 34,
                    child: Padding(
                      padding: EdgeInsets.only(left: 125),
                      child: Icon(
                        CupertinoIcons.text_bubble,
                        color: Colors.black,
                      ),
                    )),
                title: const Text(
                  'تأجيل',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
