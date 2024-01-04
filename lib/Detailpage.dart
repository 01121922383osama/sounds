import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import 'model/Musics.dart';

class Detailpage extends StatefulWidget {
  final Musics mMusic;
  final AudioPlayer audioPlayer;
  const Detailpage({
    Key? key,
    required this.mMusic,
    required this.audioPlayer,
  }) : super(key: key);

  @override
  State<Detailpage> createState() => _DetailpageState();
}

class _DetailpageState extends State<Detailpage> {
  IconData btnIcon = Icons.play_arrow;

  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  @override
  void initState() {
    super.initState();

    setupAudioPlayer();
  }

  void setupAudioPlayer() {
    widget.audioPlayer.durationStream.listen((event) {
      setState(() {
        duration = event ?? Duration.zero;
      });
    });

    widget.audioPlayer.positionStream.listen((event) {
      setState(() {
        position = event;
      });
    });

    widget.audioPlayer.playerStateStream.listen((playerState) {
      if (playerState.playing) {
        setState(() {
          btnIcon = Icons.pause;
        });
      } else {
        setState(() {
          btnIcon = Icons.play_arrow;
        });
      }
    });
  }

  void playPause() {
    if (widget.audioPlayer.playing) {
      widget.audioPlayer.pause();
    } else {
      widget.audioPlayer.play();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 52.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  child: const Icon(
                    Icons.arrow_drop_down,
                    color: Colors.red,
                  ),
                ),
                const Text("playlist"),
                const Icon(
                  Icons.playlist_add,
                ),
              ],
            ),
            const Spacer(),
            Text(
              widget.mMusic.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6.0),
            Slider.adaptive(
              value: position.inSeconds.toDouble(),
              min: 0.0,
              max: duration.inSeconds.toDouble(),
              onChanged: (value) {
                widget.audioPlayer.seek(Duration(seconds: value.toInt()));
              },
            ),
            const Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.fast_rewind,
                  color: Colors.red,
                  size: 42.0,
                ),
                const SizedBox(width: 32.0),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: IconButton(
                      onPressed: playPause,
                      icon: Icon(btnIcon),
                      iconSize: 42.0,
                      color: Colors.red,
                    ),
                  ),
                ),
                const SizedBox(width: 32.0),
                const Icon(
                  Icons.fast_forward,
                  color: Colors.red,
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
                  color: Colors.red,
                ),
                Icon(
                  Icons.shuffle,
                  color: Colors.red,
                ),
                Icon(
                  Icons.repeat,
                  color: Colors.red,
                ),
              ],
            ),
            const SizedBox(height: 58.0),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    widget.audioPlayer.dispose();
    super.dispose();
  }
}
