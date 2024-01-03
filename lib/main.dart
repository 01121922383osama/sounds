import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'screens/drawer_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // builder: (context, widget) => ResponsiveWrapper(
      //   // BouncingScrollWrapper.builder(context, widget!),
      //   maxWidth: 1200,
      //   minWidth: 400.0,
      //   defaultScale: true,
      //   // breakpoints: const [
      //   //   ResponsiveBreakpoint.resize(450, name: MOBILE),
      //   //   ResponsiveBreakpoint.autoScale(450, name: TABLET),
      //   //   ResponsiveBreakpoint.autoScale(450, name: TABLET),
      //   //   ResponsiveBreakpoint.resize(450, name: DESKTOP),
      //   //   ResponsiveBreakpoint.autoScale(450, name: "4K"),
      //   // ],
      // ),
      title: 'Flutter',
      debugShowCheckedModeBanner: false,
      // scrollBehavior: MyCustomScrollBehavior(),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Splash(),
    );
  }
}

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => const DrawerScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF224907),
      //backgroundColor:Color.fromRGBO(143, 148, 251, 2),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/Images/images.jpg',
              height: 400,
              width: 500,
            ),
            const SizedBox(
              height: 30,
            ),
            if (Platform.isIOS)
              const CupertinoActivityIndicator(
                radius: 15,
              )
            else
              const CircularProgressIndicator(
                color: Colors.amber,
              )
          ],
        ),
      ),
    );
  }
}
