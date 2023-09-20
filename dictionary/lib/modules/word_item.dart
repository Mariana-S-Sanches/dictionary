import 'package:flutter/material.dart';
import '../utils/components/navigator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc_cubit/presenter/word_search.dart';
import 'package:dictionary/utils/text_styles.dart';
import 'package:dictionary/utils/default_colors.dart';
import '../bloc_cubit/presenter/cubit/words_cubit.dart';
import '../bloc_cubit/presenter/cubit/words_state.dart';
import 'package:dictionary/bloc_cubit/model/word_model.dart';
import 'package:dictionary/utils/components/form_field.dart';
import 'package:dictionary/bloc_cubit/model/word_presset.dart';
import 'package:dictionary/utils/components/scrollbar_letters.dart';

class WordItemWidget extends StatefulWidget {
  const WordItemWidget({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _WordItemWidgetState createState() => _WordItemWidgetState();
}

class _WordItemWidgetState extends State<WordItemWidget> {
  List<List<WordsModel>> model = [
    WordLetterModel.presset_a,
    WordLetterModel.presset_b,
  ];

  @override
  void initState() {
    context.read<WordsMethodsCubit>().doLoadWord(context);

    super.initState();
  }

  TextEditingController controllerSearch = TextEditingController();
  ScrollController ctr = ScrollController();
  double position = 0.0;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WordsMethodsCubit, WordsState>(
      listener: (context, state) {
        if (state is WordsLoadState) {
          setState(() {});
        }
      },
      builder: (context, state) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: CustomTextFields(
                          labelText: 'Procurar palavras',
                          controller: controllerSearch,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: GestureDetector(
                          onTap: () {
                            context.read<WordsMethodsCubit>().doGetWordMethods(controllerSearch.text);
                          },
                          child: const Icon(
                            Icons.search,
                            color: DefaultColors.neutral,
                          ),
                        ),
                      )
                    ],
                  ),
                  if (state is WordsSucessState) component(state.wordsModel),
                  Expanded(
                    child: ListView.builder(
                      controller: ctr,
                      itemCount: model.length,
                      itemBuilder: (_, i) {
                        return GetBoxOffse(
                          offset: (offset) {
                            position = offset.dy;
                          },
                          child: state is WordsLoadState || state is WordsSucessState
                              ? ListView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: model[i].length,
                                  itemBuilder: (context, index) {
                                    return component(model[i][index]);
                                  },
                                )
                              : const SizedBox(),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            ScrollBarLetters(
              controller: ctr,
              position: position,
            ),
          ],
        );
      },
    );
  }

  component(WordsModel word) {
    return GestureDetector(
      onTap: () {
        functionNavigate(word);
      },
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: DefaultColors.background,
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    word.word!,
                    style: CustomTextStyles.bodySmall,
                    textAlign: TextAlign.center,
                  ),
                  const Icon(
                    Icons.arrow_forward_ios,
                    color: DefaultColors.neutral,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  functionNavigate(WordsModel item) {
    Navigator.push(
      context,
      RouteNavigator(page: WordSearch(wordsModel: item)),
    );
  }
}
