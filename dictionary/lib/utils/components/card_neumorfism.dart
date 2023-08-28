import 'package:dictionary/utils/default_colors.dart';
import 'package:dictionary/utils/text_styles.dart';
import 'package:flutter/material.dart';

import '../../bloc_cubit/model/word_model.dart';

class CardNeumosrfism extends StatelessWidget {
  const CardNeumosrfism({Key? key, required this.wordsModel}) : super(key: key);

  final WordsModel wordsModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.2,
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                wordsModel.word!,
                style: CustomTextStyles.headH1,
              ),
              Text(
                wordsModel.syllables!.list.toString().replaceAll('[', '').replaceAll(']', ''),
                style: CustomTextStyles.body,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
