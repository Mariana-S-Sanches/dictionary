import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import '../../bloc_cubit/model/word_model.dart';
import 'package:dictionary/utils/default_colors.dart';

enum TtsState { playing, stopped, paused, continued }

class AudioPlayer extends StatefulWidget {
  const AudioPlayer({Key? key, required this.wordsModel}) : super(key: key);

  final WordsModel wordsModel;

  @override
  State<AudioPlayer> createState() => _AudioPlayerState();
}

class _AudioPlayerState extends State<AudioPlayer> {
  FlutterTts tts = FlutterTts();

  TtsState state = TtsState.stopped;
  double audio = 0.1;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: DefaultColors.neutral[50]!.withOpacity(0.05),
            offset: const Offset(-28, -28),
            blurRadius: 30.0,
          ),
          BoxShadow(
            color: DefaultColors.neutral[50]!,
            offset: const Offset(25, 25),
            blurRadius: 30.0,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(right: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: audioPlayer(),
            ),
            Expanded(
              child: Slider(
                inactiveColor: DefaultColors.primaryTheme.shade200,
                activeColor: DefaultColors.primaryTheme,
                value: audio / widget.wordsModel.word!.length,
                onChanged: (value) {
                  setState(() {
                    audio = value;
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget audioPlayer() {
    Widget button;
    switch (state) {
      case TtsState.playing:
        button = IconButton(
          onPressed: () async {
            pausePlayer();
          },
          icon: const Icon(
            Icons.pause_rounded,
          ),
        );
        break;
      case TtsState.paused:
      case TtsState.stopped:
      default:
        button = IconButton(
          onPressed: () async {
            startPlayer();
          },
          icon: const Icon(
            Icons.play_arrow_rounded,
          ),
        );
        break;
    }
    return button;
  }

  startPlayer() async {
    tts.setProgressHandler((text, start, end, word) {
      setState(() {
        audio = end.toDouble();
        if (start == end) {
          setState(() {
            state = TtsState.paused;
          });
        }
      });
    });
    await tts.setLanguage('en');
     tts.awaitSpeakCompletion(true);
    await tts.speak(widget.wordsModel.word!);
    setState(() {
      state = TtsState.playing;
    });
  }

  pausePlayer() async {
    tts.setProgressHandler((text, start, end, word) {
      setState(() {
        audio = end.toDouble();
      });
    });
    await tts.setLanguage('en');
    await tts.pause();
    setState(() {
      state = TtsState.paused;
    });
  }

  resumePlayer() async {}
}
