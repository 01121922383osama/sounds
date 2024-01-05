import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import 'model/Musics.dart';

class Detailpage extends StatefulWidget {
  final Musics mMusic;
  final AudioPlayer audioPlayer;
  final List<Musics> playlist;

  const Detailpage({
    Key? key,
    required this.mMusic,
    required this.audioPlayer,
    required this.playlist,
  }) : super(key: key);

  @override
  State<Detailpage> createState() => _DetailpageState();
}

class _DetailpageState extends State<Detailpage> {
  IconData btnIcon = Icons.play_arrow;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    setInitialAudio();
    setupAudioPlayer();
  }

  void setInitialAudio() {
    widget.audioPlayer.setAsset(widget.playlist[currentIndex].url);
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

      if (position >= duration) {
        playNext();
      }
    });

    widget.audioPlayer.playerStateStream.listen((playerState) {
      setState(() {
        btnIcon = playerState.playing ? Icons.pause : Icons.play_arrow;
      });
    });
  }

  void playPause() {
    try {
      if (widget.audioPlayer.playing) {
        widget.audioPlayer.pause();
      } else if (!widget.audioPlayer.playing) {
        widget.audioPlayer.play();
      }
    } catch (e) {
      print('Error during play/pause: $e');
    }
  }

  void playNext() {
    try {
      currentIndex = (currentIndex + 1) % widget.playlist.length; // Wrap around
      widget.audioPlayer.setAsset(widget.playlist[currentIndex].url);
      widget.audioPlayer.play();
    } catch (e) {
      print('Error during play next: $e');
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
                IconButton(
                  onPressed: () {
                    // Uncomment the line below to repeat the same song
                    // widget.audioPlayer.seek(Duration.zero);
                    // Uncomment the line below to play the next song
                    playNext();
                  },
                  icon: const Icon(
                    Icons.fast_rewind,
                    color: Colors.red,
                    size: 42.0,
                  ),
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
                IconButton(
                  onPressed: () {
                    playNext();
                  },
                  icon: const Icon(
                    Icons.fast_forward,
                    color: Colors.red,
                    size: 42.0,
                  ),
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
