import 'package:dictionary/utils/components/audio_player.dart';

import '../model/word_model.dart';
import 'package:flutter/material.dart';
import '../../utils/components/card_neumorfism.dart';
import 'package:dictionary/utils/default_colors.dart';

class WordSearch extends StatefulWidget {
  const WordSearch({Key? key, required this.wordsModel}) : super(key: key);

  final WordsModel wordsModel;

  @override
  _WordSearchState createState() => _WordSearchState();
}

class _WordSearchState extends State<WordSearch> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: DefaultColors.highlight_grey,
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 30),
            child: CardNeumosrfism(wordsModel: widget.wordsModel),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: AudioPlayer(wordsModel: widget.wordsModel),
          ),
        
        ],
      ),
    );
  }
}
