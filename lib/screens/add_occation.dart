import 'dart:developer';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:just_audio/just_audio.dart';
import 'package:sounds/Detailpage.dart';

import '../components/custom_list_view.dart';
import '../model/Musics.dart';
import 'Letters.dart';

class AddOccation extends StatefulWidget {
  const AddOccation({Key? key}) : super(key: key);

  @override
  State<AddOccation> createState() => _AddOccationState();
}

class _AddOccationState extends State<AddOccation> {
  late List<Musics> musics;
  final AudioPlayer audioPlayer = AudioPlayer();
  @override
  void initState() {
    musics = getMusicsList();
    super.initState();
  }

  List<Musics> getMusicsList() {
    return [
      Musics(
        title: "فؤاد الثلايا",
        image: "assets/Images/9635541.png",
        url: "assets/songs/1.mp3",
      ),
      Musics(
        title: "فؤاد الثلايا",
        image: "assets/Images/9635541.png",
        url: "assets/songs/1.mp3",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF224907),
      bottomNavigationBar: CurvedNavigationBar(
        animationDuration: const Duration(milliseconds: 300),
        onTap: (index) {
          log(index.toString());
        },
        items: [
          GestureDetector(
            child: Image.asset(
              'assets/Images/9635541.png',
              width: 55,
              height: 55,
              color: const Color(0xFF224907),
            ),
          ),
          GestureDetector(
            child: Image.asset(
              'assets/Images/4520939.png',
              width: 55,
              height: 55,
              color: const Color(0xFF224907),
            ),
          ),
          GestureDetector(
            child: Image.asset(
              'assets/Images/1851373.png',
              width: 55,
              height: 55,
              color: const Color(0xFF224907),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const Letters()),
              );
            },
          ),
        ],
        height: 55,
        backgroundColor: Colors.amber,
      ),
      appBar: AppBar(
        title: const Padding(
          padding: EdgeInsets.only(left: 250),
          child: Text(
            'خطب',
            style: TextStyle(color: Color(0xFF224907)),
          ),
        ),
        backgroundColor: Colors.amber,
        leading: IconButton(
          onPressed: () {
            if (ZoomDrawer.of(context)!.isOpen()) {
              ZoomDrawer.of(context)!.close();
            } else {
              ZoomDrawer.of(context)!.open();
            }
          },
          icon: const Icon(
            Icons.menu,
            color: Color(0xFF224907),
            size: 50,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: musics.length,
                  itemBuilder: (context, index) => customListView(
                    onTap: () async {
                      // /////////////////////////////////////
                      // /////////////////////////////////////
                      // /////////////////////////////////////

                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Detailpage(
                            mMusic: musics[index], audioPlayer: audioPlayer),
                      ));
                      await audioPlayer.setAsset(musics[index].url);
                      await audioPlayer.play();

                      // /////////////////////////////////////
                      // /////////////////////////////////////
                      // /////////////////////////////////////
                    },
                    title: musics[index].title,
                    image: musics[index].image,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
