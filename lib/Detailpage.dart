import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import 'model/Musics.dart';

class Detailpage extends StatefulWidget {
  const Detailpage({
    super.key,
    required this.mMusic,
  });
  final Musics mMusic;
  @override
  State<Detailpage> createState() => _DetailpageState();
}

class _DetailpageState extends State<Detailpage> {
  IconData btnIcon = Icons.play_arrow;

  Duration duration = const Duration();
  Duration position = const Duration();

  AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = false;
  String currentSong = "";

  void playMusic(String url) async {
    if (isPlaying && currentSong != url) {
      audioPlayer.pause();
      int result = await audioPlayer.play() as int;
      if (result == 1) {
        setState(() {
          currentSong = url;
        });
      }
    } else if (!isPlaying) {
      int result = await audioPlayer.play() as int;
      if (result == 1) {
        setState(() {
          isPlaying = true;
          btnIcon = Icons.pause;
        });
      }
    }
    audioPlayer.durationStream.listen((event) {
      setState(() {
        duration = event!;
      });
    });
    audioPlayer.durationStream.listen((event) {
      setState(() {
        position = event!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(),
            ),
            Container(
              decoration: const BoxDecoration(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 52.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        child: const Icon(
                          Icons.arrow_drop_down,
                          color: Colors.blue,
                        ),
                      ),
                      const Column(
                        children: [
                          Text(
                            "playlist",
                          )
                        ],
                      ),
                      const Icon(
                        Icons.playlist_add,
                      )
                    ],
                  ),
                  const Spacer(),
                  Text(widget.mMusic.title),
                  const SizedBox(
                    height: 6.0,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 42.0,
            ),
            Slider.adaptive(
                value: position.inSeconds.toDouble(),
                min: 0.0,
                max: duration.inSeconds.toDouble(),
                onChanged: (value) {}),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.fast_forward,
                  color: Colors.blue,
                  size: 42.0,
                ),
                const SizedBox(
                  width: 32.0,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                      onPressed: () {
                        playMusic(widget.mMusic.url);
                        if (isPlaying) {
                          audioPlayer.pause();
                          setState(() {
                            btnIcon = Icons.play_arrow;
                            isPlaying = false;
                          });
                        } else {
                          audioPlayer.pause();
                          setState(() {
                            btnIcon = Icons.pause;
                            isPlaying = true;
                          });
                        }
                      },
                      icon: Icon(btnIcon),
                      iconSize: 42.0,
                      color: Colors.blue,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 32.0,
                ),
                const Icon(
                  Icons.fast_forward,
                  color: Colors.blue,
                  size: 42.0,
                ),
              ],
            ),
            const Spacer(),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Icon(
                  Icons.bookmark_border,
                  color: Colors.blue,
                ),
                Icon(
                  Icons.shuffle,
                  color: Colors.blue,
                ),
                Icon(
                  Icons.repeat,
                  color: Colors.blue,
                ),
              ],
            ),
            const SizedBox(
              height: 58.0,
            ),
          ],
        ),
      ),
    );
  }
}
